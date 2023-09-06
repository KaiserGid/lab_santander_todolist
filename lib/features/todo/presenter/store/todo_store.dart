import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/features/todo/domain/usecases/get_todos.dart';
import 'package:flutter_playground/features/todo/external/datasource/todo_datasource.dart';
import 'package:flutter_playground/features/todo/infra/repositories_impl/todo_repository.dart';

import '../../domain/entities/todo.dart';

class TodoStore extends ChangeNotifier {
  late final GetTodosUseCase _getTodosUseCase;

  TodoStore() {
    _getTodosUseCase = GetTodosUseCase(todoRepository: TodoRepositoryImpl(todoDatasource: TodoDatasourceImpl(dio: Dio())));
  }

  List<Todo> todos = [];

  void getAll() async {
    debugPrint('atualizou');
    todos = await _getTodosUseCase().then((value) => value.todos ?? []);
    notifyListeners();
  }
}
