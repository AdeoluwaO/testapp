import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@JsonSerializable()
@freezed
abstract class MovieModel with _$MovieModel {
  const factory MovieModel({
    @JsonKey(name: 'poster_path') required String cover,
    required String title,
    @JsonKey(name: 'vote_average') required double rating,
    required double id,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
