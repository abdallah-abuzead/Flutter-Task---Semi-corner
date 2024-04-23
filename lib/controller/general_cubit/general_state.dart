part of 'general_cubit.dart';

@immutable
abstract class GeneralStates {}

class GeneralInitial extends GeneralStates {}


// Now Playing Movies
class MoviesLoadingState extends GeneralStates {}

class MoviesLoadedState extends GeneralStates {
  final List<MoviesModel> movies;

  MoviesLoadedState({required this.movies});
}

class MoviesErrorState extends GeneralStates {
  final String error;

  MoviesErrorState({required this.error});
}

// Video You Tube
class VideoLoadingState extends GeneralStates {}
class VideoLoadedState extends GeneralStates {
  final List<VideoModel> videos;
  VideoLoadedState({required this.videos});
}
class VideoErrorState extends GeneralStates {
  final String error;
  VideoErrorState({required this.error});
}

// Popular Movies
class PopularLoadingState extends GeneralStates {}

class PopularLoadedState extends GeneralStates {
  final List<MoviesModel> movies;

  PopularLoadedState({required this.movies});
}

class PopularErrorState extends GeneralStates {
  final String error;

  PopularErrorState({required this.error});
}

// Top Rated Movies

class TopRatedLoadingState extends GeneralStates {}

class TopRatedLoadedState extends GeneralStates {
  final List<MoviesModel> movies;

  TopRatedLoadedState({required this.movies});
}

class TopRatedErrorState extends GeneralStates {
  final String error;

  TopRatedErrorState({required this.error});
}
// UpComing Movies
class UpComingLoadingState extends GeneralStates {}

class UpComingLoadedState extends GeneralStates {
  final List<MoviesModel> movies;

  UpComingLoadedState({required this.movies});
}

class UpComingErrorState extends GeneralStates {
  final String error;

  UpComingErrorState({required this.error});
}

