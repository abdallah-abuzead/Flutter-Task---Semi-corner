import 'package:flutter/material.dart';
import 'package:flutter_task_semi_corner_movies/model/models/movies_model.dart';
import 'package:flutter_task_semi_corner_movies/view/details_view.dart';

class OneItemBuilder extends StatelessWidget {
  const OneItemBuilder({
    super.key,
    required this.allMovies,
    required this.index,
  });

  final List<MoviesModel> allMovies;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailsScreen.routeName,
          arguments: allMovies[index],
        );
      },
      child: GridTile(
        footer: Hero(
          tag: allMovies[index].id.toString(),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.black87,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            child: Text(
              "${allMovies[index].originalTitle}",
              maxLines: 1,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        child: buildImage(),
      ),
    );
  }


  ClipRRect buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://image.tmdb.org/t/p/w500${allMovies[index].posterPath}",
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const Center(
              child: CircularProgressIndicator(
                  // value: loadingProgress.expectedTotalBytes != null
                  //     ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                  //     : null,
                  ),
            );
          }
        },
      ),
    );
  }
}
