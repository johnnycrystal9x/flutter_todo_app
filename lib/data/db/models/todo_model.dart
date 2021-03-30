import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends Equatable {
  final String id;
  final String text;
  final String note;
  final bool isDone;
  final String userId;

  TodoModel({
    this.id = "",
    this.text = "",
    this.note = "",
    this.isDone = false,
    this.userId = "",
  });

  TodoModel copyWith({
    String id,
    String text,
    String note,
    bool isDone,
    String userId,
  }) {
    return TodoModel(
      id: id ?? this.id,
      text: text ?? this.text,
      note: note ?? this.note,
      isDone: isDone ?? this.isDone,
      userId: userId ?? this.userId,
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  factory TodoModel.fromDocument(DocumentSnapshot doc) => TodoModel(
        id: doc.data()['id'],
        text: doc.data()['text'],
        note: doc.data()['note'],
        isDone: doc.data()['isDone'],
        userId: doc.data()['userId'],
      );

  @override
  List<Object> get props => <Object>[
        id,
        text,
        note,
        isDone,
        userId,
      ];
}
