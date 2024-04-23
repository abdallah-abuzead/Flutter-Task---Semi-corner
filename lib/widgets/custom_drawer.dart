import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_semi_corner_movies/controller/theme_cubit/theme_cubit.dart';
import 'package:flutter_task_semi_corner_movies/view/upcoming_view.dart';
import 'package:flutter_task_semi_corner_movies/view/popular_view.dart';
import 'package:flutter_task_semi_corner_movies/view/top_rated_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/movies2.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(''),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Now Playing'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            leading: const Icon(Icons.theaters),
            title: const Text('Popular'),
            onTap: () {
              Navigator.of(context).pushNamed(PopularView.routeName);
            },
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            leading: const Icon(Icons.moving),
            title: const Text('Top Rated'),
            onTap: () {
              Navigator.of(context).pushNamed(TopRatedView.routeName);
            },
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            leading: const Icon(Icons.upcoming),
            title: const Text('Upcoming'),
            onTap: () {
              Navigator.of(context).pushNamed(UpComingView.routeName);
            },
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final themeCubit = BlocProvider.of<ThemeCubit>(context);
              return SwitchListTile(
                secondary: const Icon(Icons.brightness_4),
                title: const Text("Dark theme"),
                subtitle: const Text("Enable dark theme"),
                value: themeCubit.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeCubit.changeAppMode();
                },
              );
            },
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
          ),
        ],
      ),
    );
  }
}
