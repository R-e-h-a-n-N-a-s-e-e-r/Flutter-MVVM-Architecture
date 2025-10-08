class MoviesModel {
  MoviesModel({List<Movies>? movies}) {
    _movies = movies;
  }

  MoviesModel.fromJson(dynamic json) {
    if (json['movies'] != null) {
      _movies = [];
      json['movies'].forEach((v) {
        _movies?.add(Movies.fromJson(v));
      });
    }
  }

  List<Movies>? _movies;

  MoviesModel copyWith({List<Movies>? movies}) =>
      MoviesModel(movies: movies ?? _movies);

  List<Movies>? get movies => _movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_movies != null) {
      map['movies'] = _movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Movies {
  Movies({
    String? id,
    String? title,
    String? year,
    List<String>? genres,
    List<num>? ratings,
    String? poster,
    dynamic contentRating, // kept dynamic as you said
    String? duration,
    String? releaseDate,
    dynamic averageRating, // kept dynamic
    String? originalTitle,
    String? storyline,
    List<String>? actors,
    dynamic imdbRating, // kept dynamic
    String? posterurl,
  }) {
    _id = id;
    _title = title;
    _year = year;
    _genres = genres;
    _ratings = ratings;
    _poster = poster;
    _contentRating = contentRating;
    _duration = duration;
    _releaseDate = releaseDate;
    _averageRating = averageRating;
    _originalTitle = originalTitle;
    _storyline = storyline;
    _actors = actors;
    _imdbRating = imdbRating;
    _posterurl = posterurl;
  }

  Movies.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _year = json['year'];
    _genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    _ratings = json['ratings'] != null ? json['ratings'].cast<num>() : [];
    _poster = json['poster'];
    _contentRating = json['contentRating'];
    _duration = json['duration'];
    _releaseDate = json['releaseDate'];
    _averageRating = json['averageRating'];
    _originalTitle = json['originalTitle'];
    _storyline = json['storyline'];
    _actors = json['actors'] != null ? json['actors'].cast<String>() : [];
    _imdbRating = json['imdbRating'];
    _posterurl = json['posterurl'];
  }

  String? _id;
  String? _title;
  String? _year;
  List<String>? _genres;
  List<num>? _ratings;
  String? _poster;
  dynamic _contentRating;
  String? _duration;
  String? _releaseDate;
  dynamic _averageRating;
  String? _originalTitle;
  String? _storyline;
  List<String>? _actors;
  dynamic _imdbRating;
  String? _posterurl;

  Movies copyWith({
    String? id,
    String? title,
    String? year,
    List<String>? genres,
    List<num>? ratings,
    String? poster,
    dynamic contentRating,
    String? duration,
    String? releaseDate,
    dynamic averageRating,
    String? originalTitle,
    String? storyline,
    List<String>? actors,
    dynamic imdbRating,
    String? posterurl,
  }) =>
      Movies(
        id: id ?? _id,
        title: title ?? _title,
        year: year ?? _year,
        genres: genres ?? _genres,
        ratings: ratings ?? _ratings,
        poster: poster ?? _poster,
        contentRating: contentRating ?? _contentRating,
        duration: duration ?? _duration,
        releaseDate: releaseDate ?? _releaseDate,
        averageRating: averageRating ?? _averageRating,
        originalTitle: originalTitle ?? _originalTitle,
        storyline: storyline ?? _storyline,
        actors: actors ?? _actors,
        imdbRating: imdbRating ?? _imdbRating,
        posterurl: posterurl ?? _posterurl,
      );

  // Getters
  String? get id => _id;
  String? get title => _title;
  String? get year => _year;
  List<String>? get genres => _genres;
  List<num>? get ratings => _ratings;
  String? get poster => _poster;
  dynamic get contentRating => _contentRating;
  String? get duration => _duration;
  String? get releaseDate => _releaseDate;
  dynamic get averageRating => _averageRating;
  String? get originalTitle => _originalTitle;
  String? get storyline => _storyline;
  List<String>? get actors => _actors;
  dynamic get imdbRating => _imdbRating;
  String? get posterurl => _posterurl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['year'] = _year;
    map['genres'] = _genres;
    map['ratings'] = _ratings;
    map['poster'] = _poster;
    map['contentRating'] = _contentRating;
    map['duration'] = _duration;
    map['releaseDate'] = _releaseDate;
    map['averageRating'] = _averageRating;
    map['originalTitle'] = _originalTitle;
    map['storyline'] = _storyline;
    map['actors'] = _actors;
    map['imdbRating'] = _imdbRating;
    map['posterurl'] = _posterurl;
    return map;
  }
}
