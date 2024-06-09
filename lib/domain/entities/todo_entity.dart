class TodoEntity {
  TodoEntity({
    required this.limit,
    required this.skip,
  });
  late final String limit;
  late final String skip;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['limit'] = limit;
    data['skip'] = skip;

    return data;
  }
}
