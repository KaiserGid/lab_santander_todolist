import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/features/todo/infra/data_source/todo_datasource.dart';

class TodoDatasourceImpl implements ITodoDatasource {
  Dio dio;

  TodoDatasourceImpl({
    required this.dio,
  });
  @override
  Future fetch() async {
    var result = await dio.get('https://jsonplaceholder.typicode.com/todos');
    try {
      if (result.statusCode == 200) {
        var todosMap = result.data;
        return todosMap;
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      DioException(requestOptions: result.requestOptions);
      return [];
    }
    return [];
  }
}
