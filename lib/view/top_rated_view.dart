import 'package:flutter/material.dart';
import 'package:flutter_task_semi_corner_movies/controller/general_cubit/general_cubit.dart';
import 'package:flutter_task_semi_corner_movies/layout/Layout_screen.dart';

class TopRatedView extends StatelessWidget {
  static const String routeName = 'TopRatedScreen';

  const TopRatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutScreen<TopRatedLoadingState, TopRatedLoadedState,
        TopRatedErrorState>(
      routeName: routeName,
      title: "Top Rated Movies ",
      showDrawer: false,
    );
  }
}
