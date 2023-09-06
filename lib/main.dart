import 'package:flutter/material.dart';
import 'package:flutter_playground/features/todo/presenter/store/todo_store.dart';
import 'package:flutter_playground/features/todo/presenter/ui/pages/todo_page.dart';
import 'package:intl/intl.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoPage(todoStore: TodoStore()),
    );
  }
}
