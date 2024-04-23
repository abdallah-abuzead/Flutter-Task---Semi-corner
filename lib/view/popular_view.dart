import 'package:flutter/material.dart';
import 'package:flutter_task_semi_corner_movies/controller/general_cubit/general_cubit.dart';
import 'package:flutter_task_semi_corner_movies/layout/Layout_screen.dart';

class PopularView extends StatelessWidget {
  static const String routeName = "PopularScreen";

  const PopularView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutScreen<PopularLoadingState, PopularLoadedState,
        PopularErrorState>(
      routeName: routeName,
      title: "Popular Movies",
      showDrawer: false,
    );
  }
}
