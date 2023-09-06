import 'package:flutter_playground/features/todo/domain/entities/todo.dart';
import 'package:flutter_playground/features/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_playground/features/todo/domain/usecases/get_todos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/list_todo.dart';

class TodoRepositoryMock extends Mock implements ITodoRepository {}

void main() {
  ITodoRepository todoRepository = TodoRepositoryMock();
  GetTodosUseCase getTodosUseCase = GetTodosUseCase(todoRepository: todoRepository);

  test('Should List todos', () async {
    //Arrange
    when(() => todoRepository.getTodos()).thenAnswer((_) async => listTodos);
    //Act
    final result = await getTodosUseCase();
    //Assert

    expect(result.todos, isA<List<Todo>>());
    expect(result.todos!.first.description, equals('delectus aut autem'));
  });
}
