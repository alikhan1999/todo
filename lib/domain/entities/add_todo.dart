class AddTodoEntity {
  AddTodoEntity({required this.todo, required this.completed, required this.userId});
  late final String todo;
  late final bool completed;
  late final String userId;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;

    return data;
  }
}
