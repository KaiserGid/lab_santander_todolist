import 'package:flutter_playground/features/todo/domain/entities/todo.dart';
import 'package:flutter_playground/features/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_playground/features/todo/infra/adapters/todo_adapter.dart';
import 'package:flutter_playground/features/todo/infra/data_source/todo_datasource.dart';

class TodoRepositoryImpl implements ITodoRepository {
  ITodoDatasource todoDatasource;

  TodoRepositoryImpl({
    required this.todoDatasource,
  });

  @override
  Future<List<Todo>> getTodos() async {
    List<Todo> todos = [];
    List todosMap = await todoDatasource.fetch();
    for (var todo in todosMap) {
      todos.add(TodoAdapter.fromJson(todo));
    }

    return todos;
  }
}
