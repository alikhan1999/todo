import 'package:dartz/dartz.dart';
import 'package:todo/application/core/failure/failure.dart';
import 'package:todo/application/core/usecases/usecase.dart';
import 'package:todo/data/models/todo/add_todo_model.dart';
import 'package:todo/data/models/todo/delete_todo_model.dart';
import 'package:todo/data/models/todo/todo_model.dart';
import 'package:todo/domain/entities/add_todo.dart';
import 'package:todo/domain/entities/delete_entity.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/entities/update_todo.dart';
import 'package:todo/domain/interfaces/todo/I_todo_repo.dart';

class TodoUseCase implements UseCase<TodoModel, TodoEntity> {
  TodoUseCase(this.repository);
  final ITodoRepo repository;

  @override
  Future<Either<Failure, TodoModel>> call(TodoEntity params) async {
    return repository.fetchTodo(params);
  }
}

class AddTodoUseCase implements UseCase<AddTodoModel, AddTodoEntity> {
  AddTodoUseCase(this.repository);
  final ITodoRepo repository;

  @override
  Future<Either<Failure, AddTodoModel>> call(AddTodoEntity params) async {
    return repository.addTodo(params);
  }
}

class UpdateTodoUseCase implements UseCase<AddTodoModel, UpdateTodoEntity> {
  UpdateTodoUseCase(this.repository);
  final ITodoRepo repository;

  @override
  Future<Either<Failure, AddTodoModel>> call(UpdateTodoEntity params) async {
    return repository.updateTodo(params);
  }
}

class DeleteTodoUseCase implements UseCase<DeleteTodoModel, DeleteTodoEntity> {
  DeleteTodoUseCase(this.repository);
  final ITodoRepo repository;

  @override
  Future<Either<Failure, DeleteTodoModel>> call(DeleteTodoEntity params) async {
    return repository.deleteTodo(params);
  }
}
