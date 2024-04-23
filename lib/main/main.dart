import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_semi_corner_movies/controller/bloc_observer/bloc_observer.dart';
import 'package:flutter_task_semi_corner_movies/controller/theme_cubit/theme_cubit.dart';
import 'package:flutter_task_semi_corner_movies/routing/app_router.dart';
import 'package:flutter_task_semi_corner_movies/view/now_playing_view.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..changeAppMode(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeCubit = BlocProvider.of<ThemeCubit>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'TenTen',
            theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
            darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
            themeMode: (state is AppChangeModeState) ? state.themeMode : ThemeMode.light,
            onGenerateRoute: AppRouter().generateRoute,
            initialRoute: NowPlayingView.routeName,
          );
        },
      ),
    );
  }
}
