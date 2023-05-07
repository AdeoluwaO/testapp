// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieModel _$$_MovieModelFromJson(Map<String, dynamic> json) =>
    _$_MovieModel(
      cover: json['poster_path'] as String,
      title: json['title'] as String,
      rating: (json['vote_average'] as num).toDouble(),
      id: (json['id'] as num).toDouble(),
    );

Map<String, dynamic> _$$_MovieModelToJson(_$_MovieModel instance) =>
    <String, dynamic>{
      'poster_path': instance.cover,
      'title': instance.title,
      'vote_average': instance.rating,
      'id': instance.id,
    };
