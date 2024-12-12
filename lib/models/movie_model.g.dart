// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterPath: json['posterPath'] as String,
      releaseDate: json['releaseDate'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['voteAverage'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'popularity': instance.popularity,
      'voteAverage': instance.voteAverage,
    };
