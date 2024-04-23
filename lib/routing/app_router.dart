import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_semi_corner_movies/controller/general_cubit/general_cubit.dart';
import 'package:flutter_task_semi_corner_movies/model/models/movies_model.dart';
import 'package:flutter_task_semi_corner_movies/model/repository/movies_repository.dart';
import 'package:flutter_task_semi_corner_movies/model/service/movies_web_services.dart';
import 'package:flutter_task_semi_corner_movies/view/details_view.dart';
import 'package:flutter_task_semi_corner_movies/view/upcoming_view.dart';
import 'package:flutter_task_semi_corner_movies/view/now_playing_view.dart';
import 'package:flutter_task_semi_corner_movies/view/popular_view.dart';
import 'package:flutter_task_semi_corner_movies/view/top_rated_view.dart';



class AppRouter {
  late GeneralCubit generalCubit;
  late MoviesRepository moviesRepository;

  AppRouter() {
    moviesRepository = MoviesRepository(moviesWebServices: MoviesWebServices());
    generalCubit = GeneralCubit(moviesRepository: moviesRepository);
  }
  GeneralCubit createGeneralCubit() {
    return GeneralCubit(moviesRepository: moviesRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NowPlayingView.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => createGeneralCubit()..fetchMovies(),
            // value:  generalCubit,
            child: const NowPlayingView(),
          ),
        );
      case DetailsScreen.routeName:
        final MoviesModel movie = settings.arguments as MoviesModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => createGeneralCubit(),
            child: DetailsScreen(movie: movie),
          ),
        );
      case PopularView.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => createGeneralCubit()..fetchPopular(),
            // value:  generalCubit,
            child: const PopularView(),
          ),
        );
      case TopRatedView.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => createGeneralCubit()..fetchTopRate(),
            // value:  generalCubit,
            child: const TopRatedView(),
          ),
        );
      case UpComingView.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => createGeneralCubit()..fetchUpcoming(),
            child: const UpComingView(),
          ),
        );
    }
    return null;
  }
}
