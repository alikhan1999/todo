import 'package:todo/data/models/todo/add_todo_model.dart';
import 'package:todo/data/models/todo/delete_todo_model.dart';
import 'package:todo/data/models/todo/todo_model.dart';
import 'package:todo/domain/entities/add_todo.dart';
import 'package:todo/domain/entities/delete_entity.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/entities/update_todo.dart';

abstract class ITodoApi {
  Future<TodoModel> fetchTodo(TodoEntity todoEntity);
  Future<AddTodoModel> addTodo(AddTodoEntity todoEntity);
  Future<AddTodoModel> updateTodo(UpdateTodoEntity todoEntity);
  Future<DeleteTodoModel> deleteTodo(DeleteTodoEntity deleteTodoEntity);
}
