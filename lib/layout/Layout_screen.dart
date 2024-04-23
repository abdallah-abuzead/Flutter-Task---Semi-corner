import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_task_semi_corner_movies/controller/general_cubit/general_cubit.dart';
import 'package:flutter_task_semi_corner_movies/model/models/movies_model.dart';
import 'package:flutter_task_semi_corner_movies/widgets/custom_drawer.dart';
import 'package:flutter_task_semi_corner_movies/widgets/custom_search_field.dart';
import 'package:flutter_task_semi_corner_movies/widgets/no_movies_found.dart';
import 'package:flutter_task_semi_corner_movies/widgets/offline_screen.dart';
import 'package:flutter_task_semi_corner_movies/widgets/one_item_builder.dart';

class LayoutScreen<TLoadingState, TLoadedState, TErrorState>
    extends StatefulWidget {
  const LayoutScreen({
    Key? key,
    required this.routeName,
    required this.title,
    this.showDrawer = true,
  }) : super(key: key);

  final String routeName;
  final String title;
  final bool showDrawer;

  @override
  State<LayoutScreen<TLoadingState, TLoadedState, TErrorState>> createState() =>
      _LayoutScreenState<TLoadingState, TLoadedState, TErrorState>();
}

class _LayoutScreenState<TLoadingState, TLoadedState, TErrorState>
    extends State<LayoutScreen<TLoadingState, TLoadedState, TErrorState>> {
  List<MoviesModel> allMovies = [];
  List<MoviesModel> searchedMovies = [];
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralCubit, GeneralStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: isSearching ? buildSearchField() : Text(widget.title),
            actions: buildAppBarAction(),
          ),
          drawer: widget.showDrawer ? const CustomDrawer() : null,
          body: buildBody(state),
        );
      },
    );
  }

  Widget buildSearchField() {
    return CustomSearchField(
      controller: searchTextController,
      onTextChanged: (searchedMovie) {
        addSearchedForItemToSearchedForList(searchedMovie);
      },
    );
  }

  Widget buildBody(state) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return buildBodyNowPlaying(state);
        } else {
          return const OfflineScreen();
        }
      },
      child: const Center(
        child: Text("No internet connection"),
      ),
    );
  }

  Widget buildBodyNowPlaying(state) {
    if (state is TLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is TLoadedState) {
      return buildMoviesLoaded(state);
    } else if (state is TErrorState) {
      return Center(
        child: Text(state.toString()),
      );
    } else {
      return const Center(
        child: Text("Error"),
      );
    }
  }

  Widget buildMoviesLoaded(dynamic state) {
    allMovies = state.movies;
    List<MoviesModel> displayedMovies =
        searchTextController.text.isEmpty ? allMovies : searchedMovies;
    if (displayedMovies.isEmpty) {
      return const NoMoviesFound();
    }
    return RefreshIndicator(
      onRefresh: () async {
        await BlocProvider.of<GeneralCubit>(context)
            .fetchMovies(); // Modify this based on the actual functionality needed
      },
      child: GridView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 300,
        ),
        itemCount: searchTextController.text.isEmpty
            ? allMovies.length
            : searchedMovies.length,
        itemBuilder: (context, index) {
          return OneItemBuilder(
            allMovies:
                searchTextController.text.isEmpty ? allMovies : searchedMovies,
            index: index,
          );
        },
      ),
    );
  }

  List<Widget> buildAppBarAction() {
    if (isSearching) {
      return [
        IconButton(
          icon: const Icon(
            Icons.search_off,
          ),
          onPressed: () {
            searchTextController.clear();
            Navigator.of(context).pop();
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: startSearch,
        ),
      ];
    }
  }


  void addSearchedForItemToSearchedForList(String searchedMovie) {
    searchedMovies = allMovies
        .where((movie) =>
            movie.originalTitle!
                .toLowerCase()
                .startsWith(searchedMovie.toLowerCase()) ||
            movie.originalTitle!
                .toUpperCase()
                .startsWith(searchedMovie.toUpperCase()))
        .toList();
    setState(() {});
  }

  void startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: () {
        // stop searching
        setState(() {
          //searchTextController.clear();
         isSearching = false;
        });
      },
    ));
    setState(() {
      isSearching = true;
    });
  }
}
