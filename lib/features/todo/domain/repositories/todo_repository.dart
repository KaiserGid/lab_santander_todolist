import 'package:flutter_playground/features/todo/domain/entities/todo.dart';

abstract class ITodoRepository {
  Future<List<Todo>> getTodos();
}
