import 'package:flutter/material.dart';
import 'package:flutter_task_semi_corner_movies/controller/general_cubit/general_cubit.dart';
import 'package:flutter_task_semi_corner_movies/layout/Layout_screen.dart';

class UpComingView extends StatelessWidget {
  static const String routeName = 'UpComingScreen';

  const UpComingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutScreen<UpComingLoadingState, UpComingLoadedState,
        UpComingErrorState>(
      routeName: routeName,
      title: "UpComing Movies ",
      showDrawer: false,
    );
  }
}
