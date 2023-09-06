import 'package:dio/dio.dart';
import 'package:flutter_playground/features/todo/external/datasource/todo_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  Dio dio = DioMock();
  TodoDatasourceImpl todoDatasource = TodoDatasourceImpl(dio: dio);

  test('Should a list of map of Todos', () async {
    //Arrange
    Response response = Response(requestOptions: RequestOptions(), data: [
      {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
      {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
      {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}
    ]);
    when(() => dio.get(any())).thenAnswer((_) async => response);
    //Act
    var result = await todoDatasource.fetch();
    //Assert

    expect(result, isA<List<Map<String, dynamic>>>());
  });
}
