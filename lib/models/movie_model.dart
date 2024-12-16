import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

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

  // From JSON: Ensure the field names match the ones in the API response
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // To JSON: This method is used when you want to convert a Movie object back to JSON
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
