
import 'package:flutter_task_semi_corner_movies/model/models/movies_model.dart';
import 'package:flutter_task_semi_corner_movies/model/models/video_model.dart';
import 'package:flutter_task_semi_corner_movies/model/service/movies_web_services.dart';

class MoviesRepository {
  final MoviesWebServices moviesWebServices;

  MoviesRepository({required this.moviesWebServices});

  Future<List<MoviesModel>> getMovies() async {
    var response = await moviesWebServices.getNowPlaying();
    return response.map((movie) => MoviesModel.fromJson(movie)).toList();
  }
  Future<List<VideoModel>> getVideos(int movieID) async {
    var response = await moviesWebServices.getVideosByID(movieID);
    print("response repository $response");
    return response.map((video) => VideoModel.fromJson(video)).toList();
  }

  Future<List<MoviesModel>> getPopular() async {
    var response = await moviesWebServices.getPopular();
    return response.map((movie) => MoviesModel.fromJson(movie)).toList();
  }

  Future<List<MoviesModel>> getTopRated() async {
    var response = await moviesWebServices.getTopRated();
    return response.map((movie) => MoviesModel.fromJson(movie)).toList();
  }
  Future<List<MoviesModel>> getUpComing() async {
    var response = await moviesWebServices.getUpComing();
    return response.map((movie) => MoviesModel.fromJson(movie)).toList();
  }
}
