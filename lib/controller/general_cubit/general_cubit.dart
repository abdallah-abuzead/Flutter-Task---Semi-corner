import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_semi_corner_movies/model/models/movies_model.dart';
import 'package:flutter_task_semi_corner_movies/model/models/video_model.dart';
import 'package:flutter_task_semi_corner_movies/model/repository/movies_repository.dart';

part 'general_state.dart';

class GeneralCubit extends Cubit<GeneralStates> {
  GeneralCubit({required this.moviesRepository}) : super(GeneralInitial());
  final MoviesRepository moviesRepository;

  Future<void> fetchMovies() async {
    emit(MoviesLoadingState());
    try {
      final response = await moviesRepository.getMovies();
      emit(MoviesLoadedState(movies: response));
    } catch (e) {
      emit(MoviesErrorState(error: e.toString()));
    }
  }

  Future<void> fetchPopular() async {
    emit(PopularLoadingState());
    try {
      final response = await moviesRepository.getPopular();
      emit(PopularLoadedState(movies: response));
    } catch (e) {
      emit(PopularErrorState(error: e.toString()));
    }
  }

  Future<void> fetchTopRate() async {
    emit(TopRatedLoadingState());
    try {
      final response = await moviesRepository.getTopRated();
      emit(TopRatedLoadedState(movies: response));
    } catch (e) {
      emit(TopRatedErrorState(error: e.toString()));
    }
  }

  Future<void> fetchUpcoming() async {
    emit(UpComingLoadingState());
    try {
      final response = await moviesRepository.getUpComing();
      emit(UpComingLoadedState(movies: response));
    } catch (e) {
      emit(UpComingErrorState(error: e.toString()));
    }
  }

  Future<void> fetchVideosByID(int movieID) async {
    try {
      emit(VideoLoadingState());
      List<VideoModel> videos = await moviesRepository.getVideos(movieID);
      emit(VideoLoadedState(videos: videos));
    } catch (e) {
      emit(VideoErrorState(error: e.toString()));
    }
  }
}
