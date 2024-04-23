import 'package:flutter/material.dart';
import 'package:flutter_task_semi_corner_movies/controller/general_cubit/general_cubit.dart';
import 'package:flutter_task_semi_corner_movies/layout/Layout_screen.dart';

class NowPlayingView extends StatelessWidget {
  static const String routeName = "NowPlayingScreen";

  const NowPlayingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutScreen<MoviesLoadingState, MoviesLoadedState,
        MoviesErrorState>(
      routeName: routeName,
      title: "Now Playing Movies",
      showDrawer: true,
    );
  }
}
