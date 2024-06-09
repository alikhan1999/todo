import 'package:dartz/dartz.dart';
import 'package:todo/application/core/failure/failure.dart';
import 'package:todo/application/network/error_handler/error_handler.dart';
import 'package:todo/data/models/todo/add_todo_model.dart';
import 'package:todo/data/models/todo/delete_todo_model.dart';
import 'package:todo/data/models/todo/todo_model.dart';
import 'package:todo/data/remote_data_source/todo/i_todo_api.dart';
import 'package:todo/domain/entities/add_todo.dart';
import 'package:todo/domain/entities/delete_entity.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/entities/update_todo.dart';
import 'package:todo/domain/interfaces/todo/I_todo_repo.dart';

class TodoRepo implements ITodoRepo {
  TodoRepo({required this.api});
  ITodoApi api;

  @override
  Future<Either<Failure, TodoModel>> fetchTodo(TodoEntity todoEntity) async {
    try {
      final result = await api.fetchTodo(todoEntity);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }

  @override
  Future<Either<Failure, AddTodoModel>> addTodo(AddTodoEntity addTodoEntity) async {
    try {
      final result = await api.addTodo(addTodoEntity);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }

  @override
  Future<Either<Failure, AddTodoModel>> updateTodo(UpdateTodoEntity updateTodoEntity) async {
    try {
      final result = await api.updateTodo(updateTodoEntity);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }

  @override
  Future<Either<Failure, DeleteTodoModel>> deleteTodo(DeleteTodoEntity deleteTodoEntity) async {
    try {
      final result = await api.deleteTodo(deleteTodoEntity);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }
}
