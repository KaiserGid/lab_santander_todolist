import 'package:flutter_playground/features/todo/domain/entities/todo.dart';

class TodoAdapter {
  static Todo fromJson(dynamic json) {
    return Todo(
      description: json['title'],
      isDone: json['completed'],
    );
  }
}
