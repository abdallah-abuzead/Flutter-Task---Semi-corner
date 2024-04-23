import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MoviesWebServices {
  late Dio dio;

  MoviesWebServices() {
    dio = Dio();
  }

  Future<List<dynamic>> getMoviesByCategory({required String category}) async {
    try {
      var response = await dio.get(
        "https://api.themoviedb.org/3/movie/$category",
        queryParameters: {
          "api_key": "01300770e1f2f458dc96b39a3362951e",
        },
      );
      return response.data['results'];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getNowPlaying() {
    return getMoviesByCategory(category: 'now_playing');
  }

  Future<List<dynamic>> getPopular() {
    return getMoviesByCategory(category: 'popular');
  }

  Future<List<dynamic>> getTopRated() {
    return getMoviesByCategory(category: 'top_rated');
  }

  Future<List<dynamic>> getUpComing() async {
    return getMoviesByCategory(category: 'upcoming');
  }

  Future<List<Map<String, dynamic>>> getVideosByID(int movieID) async {
    try {
      var response = await dio.get(
        "https://api.themoviedb.org/3/movie/$movieID/videos",
        queryParameters: {
          "api_key": "01300770e1f2f458dc96b39a3362951e",
        },
      );
      List<dynamic> results = response.data['results'];
      //print("result web services $results");
      //return results.map((json) => VideoModel.fromJson(json)).toList();
      return results.cast<Map<String, dynamic>>();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
