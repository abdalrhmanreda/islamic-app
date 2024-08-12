import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasbeeh_model.g.dart';

@JsonSerializable()
class TasbeehModel {
  final int count;
  final String content;
  final String description;

  TasbeehModel(
      {required this.count, required this.content, required this.description});

  factory TasbeehModel.fromJson(Map<String, dynamic> json) =>
      _$TasbeehModelFromJson(json);
}
