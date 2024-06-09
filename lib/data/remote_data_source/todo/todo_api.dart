import 'package:dio/dio.dart';
import 'package:todo/application/core/exception/exception.dart';
import 'package:todo/application/network/error_handler/error_handler.dart';
import 'package:todo/application/network/remote_client/iApService.dart';
import 'package:todo/data/models/todo/add_todo_model.dart';
import 'package:todo/data/models/todo/delete_todo_model.dart';
import 'package:todo/data/models/todo/todo_model.dart';
import 'package:todo/data/remote_data_source/todo/i_todo_api.dart';
import 'package:todo/domain/entities/add_todo.dart';
import 'package:todo/domain/entities/delete_entity.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/entities/update_todo.dart';

class TodoApi implements ITodoApi {
  TodoApi(IApiService api) {
    api.setIsTokenRequired(true);
    _dio = api.get();
  }

  @override
  Future<TodoModel> fetchTodo(TodoEntity todoEntity) async {
    try {
      final res = await _dio.get('todos?limit=${todoEntity.limit}&skip=${todoEntity.skip}');
      return TodoModel.fromJson(res.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  @override
  Future<AddTodoModel> addTodo(AddTodoEntity addTodoEntity) async {
    try {
      final res = await _dio.post('todos/add', data: addTodoEntity.toJson());
      return AddTodoModel.fromJson(res.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  @override
  Future<AddTodoModel> updateTodo(UpdateTodoEntity updateTodoEntity) async {
    try {
      final res = await _dio.put('todos/${updateTodoEntity.id}', data: updateTodoEntity.toJson());
      return AddTodoModel.fromJson(res.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  @override
  Future<DeleteTodoModel> deleteTodo(DeleteTodoEntity deleteTodoEntity) async {
    try {
      final res = await _dio.delete(
        'todos/${deleteTodoEntity.userId}',
      );
      return DeleteTodoModel.fromJson(res.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  late Dio _dio;
}
