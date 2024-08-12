// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasbeeh_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasbeehModel _$TasbeehModelFromJson(Map<String, dynamic> json) => TasbeehModel(
      count: (json['count'] as num).toInt(),
      content: json['content'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TasbeehModelToJson(TasbeehModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'content': instance.content,
      'description': instance.description,
    };
