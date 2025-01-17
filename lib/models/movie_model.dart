import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String overview;
  final String? poster_path;
  final String? release_date ;
  final double? vote_average;
  final int? vote_count;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.vote_average,
    required this.vote_count,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
