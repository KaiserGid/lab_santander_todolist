import 'package:flutter/material.dart';
import 'package:flutter_playground/features/todo/presenter/store/todo_store.dart';
import 'package:flutter_playground/features/todo/presenter/ui/widgets/todo_listviewr.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key, required this.todoStore});

  final TodoStore todoStore;

  @override
  Widget build(BuildContext context) {
    todoStore.getAll();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: todoStore.getAll,
        child: const Icon(Icons.refresh),
      ),
      body: AnimatedBuilder(
          animation: todoStore,
          builder: (context, child) {
            debugPrint('carregou denovo');
            return TodoListView(todos: todoStore.todos);
          }),
    );
  }
}
