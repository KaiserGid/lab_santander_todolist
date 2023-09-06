import 'package:flutter_playground/features/todo/domain/entities/todo.dart';
import 'package:flutter_playground/features/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_playground/features/todo/infra/data_source/todo_datasource.dart';
import 'package:flutter_playground/features/todo/infra/repositories_impl/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/map_todo.dart';

class TodoDatasourceMock extends Mock implements ITodoDatasource {}

void main() {
  ITodoDatasource todoDatasource = TodoDatasourceMock();
  ITodoRepository todoRepository = TodoRepositoryImpl(todoDatasource: todoDatasource);

  test('Should list of Todos', () async {
    //Arrange
    when(() => todoDatasource.fetch()).thenAnswer((_) async => todos);
    //Act
    var result = await todoRepository.getTodos();
    //Assert
    expect(result, isA<List<Todo>>());
  });
}
