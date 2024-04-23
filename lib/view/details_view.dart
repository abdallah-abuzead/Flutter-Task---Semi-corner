import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_task_semi_corner_movies/controller/general_cubit/general_cubit.dart';
import 'package:flutter_task_semi_corner_movies/model/models/movies_model.dart';
import 'package:url_launcher/link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'DetailsScreen';

  const DetailsScreen({super.key, required this.movie});

  final MoviesModel movie;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GeneralCubit>(context).fetchVideosByID(movie.id!);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${movie.originalTitle}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                          "Year of release : ${movie.releaseDate?.substring(0, 4)}"),
                      const Divider(),
                      Text(
                          "Original Language : ${movie.originalLanguage?.toUpperCase()}"),
                      const Divider(),
                      Row(
                        children: [
                          Text(
                            "Vote Average : ${movie.voteAverage?.toStringAsFixed(1)}",
                          ),
                          const Spacer(),
                          RatingBar.builder(
                            initialRating: movie.voteAverage! / 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                      const Divider(),
                      const Text(
                        "The story of The Movie :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text("${movie.overview}"),
                      const Divider(),
                      Text(
                          "Genre IDS : ${movie.genreIds?.join(" / ").toString()}"),
                      const Divider(),
                      BlocBuilder<GeneralCubit, GeneralStates>(
                        builder: (context, state) {
                          if (state is VideoLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is VideoLoadedState) {
                            final officialTrailerVideo =
                                state.videos.firstWhere(
                              (element) => element.name == "Official Trailer",
                            );
                            return Link(
                              target: LinkTarget.defaultTarget,
                              uri: Uri.parse(
                                "https://www.youtube.com/watch?v=${officialTrailerVideo.key}",
                              ),
                              builder: (context, followLink) => Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 100,
                                    ),
                                    onPressed: followLink,
                                    label: const Text(
                                      "Watch Trailer",
                                    ),
                                    icon: const FaIcon(
                                      FontAwesomeIcons.youtube,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else if (state is VideoErrorState) {
                            return Text(
                              state.error.toString(),
                            );
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 400,
      backgroundColor: Colors.grey,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Hero(
          tag: movie.id.toString(),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
            fit: BoxFit.cover,
          ),
        ),
        // title: Text(
        //   "${movie.originalTitle}",
        //   style: const TextStyle(
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
    );
  }
}
