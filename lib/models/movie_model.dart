import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart'; // This will be generated automatically.

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double popularity;
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
  });

  // Factory constructor to create a Movie instance from JSON
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // Method to convert a Movie instance to JSON
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
