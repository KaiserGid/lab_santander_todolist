import 'package:flutter/material.dart';

import '../../../domain/entities/todo.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> todos;

  const TodoListView({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: todos.isEmpty,
      replacement: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          Todo todo = todos[index];
          return ListTile(
            title: Text(todo.description),
            trailing: Checkbox(
              value: todo.isDone,
              onChanged: (value) {},
            ),
          );
        },
      ),
      child: const Center(
        child: Text('Não a dados'),
      ),
    );
  }
}
