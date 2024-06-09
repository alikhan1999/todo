class AddTodoModel {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  AddTodoModel({this.id, this.todo, this.completed, this.userId});

  AddTodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    return data;
  }
}
