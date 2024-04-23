class MoviesModel {
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;

  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  String? title;

  double? voteAverage;
  int? voteCount;
  List<int>? genreIds;


  MoviesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    genreIds = json['genre_ids'].cast<int>();
  }
}


