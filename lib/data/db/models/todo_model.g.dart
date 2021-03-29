// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return TodoModel(
    id: json['id'] as String,
    text: json['text'] as String,
    note: json['note'] as String,
    isDone: json['isDone'] as bool,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'note': instance.note,
      'isDone': instance.isDone,
      'userId': instance.userId,
    };
