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
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: (json['voteCount'] as num).toInt(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
