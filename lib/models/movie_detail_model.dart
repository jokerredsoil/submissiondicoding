import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String? backdrop_path;
  final String? poster_path;
  final String release_date;
  final int runtime;
  final double vote_average;
  final int vote_count;
  final List<Genre> genres;
  final List<ProductionCompany> production_companies;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    this.backdrop_path,
    this.poster_path,
    required this.release_date,
    required this.runtime,
    required this.vote_average,
    required this.vote_count,
    required this.genres,
    required this.production_companies,
  });

  /// From JSON factory
  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  /// To JSON method
  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}

@JsonSerializable()
class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  final int id;
  final String name;
  final String? logo_path;
  final String origin_country;

  ProductionCompany({
    required this.id,
    required this.name,
    this.logo_path,
    required this.origin_country,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}
