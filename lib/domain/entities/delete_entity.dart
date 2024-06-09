class DeleteTodoEntity {
  DeleteTodoEntity({
    required this.userId,
  });
  late final String userId;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = userId;

    return data;
  }
}
