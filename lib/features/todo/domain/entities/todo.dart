class Todo {
  final String description;
  final bool isDone;

  Todo({required this.description, required this.isDone});

  Todo copyWith({
    String? description,
    bool? isDone,
  }) {
    return Todo(
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
