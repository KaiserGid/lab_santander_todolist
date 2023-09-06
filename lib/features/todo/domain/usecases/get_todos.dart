import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetTodosUseCase {
  ITodoRepository todoRepository;

  GetTodosUseCase({
    required this.todoRepository,
  });

  Future<({Exception? failure, List<Todo>? todos})> call() async {
    try {
      List<Todo> todos = await todoRepository.getTodos();
      return (failure: null, todos: todos);
    } catch (e) {
      return (failure: Exception(), todos: null);
    }
  }
}
