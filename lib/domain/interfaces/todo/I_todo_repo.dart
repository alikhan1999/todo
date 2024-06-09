import 'package:dartz/dartz.dart';
import 'package:todo/application/core/failure/failure.dart';
import 'package:todo/data/models/todo/add_todo_model.dart';
import 'package:todo/data/models/todo/delete_todo_model.dart';
import 'package:todo/data/models/todo/todo_model.dart';
import 'package:todo/domain/entities/add_todo.dart';
import 'package:todo/domain/entities/delete_entity.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/entities/update_todo.dart';

abstract class ITodoRepo {
  Future<Either<Failure, TodoModel>> fetchTodo(TodoEntity params);
  Future<Either<Failure, AddTodoModel>> addTodo(AddTodoEntity addTodoEntity);
  Future<Either<Failure, AddTodoModel>> updateTodo(UpdateTodoEntity updateTodoEntity);
  Future<Either<Failure, DeleteTodoModel>> deleteTodo(DeleteTodoEntity deleteTodoEntity);
}
