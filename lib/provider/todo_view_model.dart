import 'package:todo/application/core/result.dart';
import 'package:todo/application/network/error_handler/error_handler.dart';
import 'package:todo/data/models/todo/todo_model.dart';
import 'package:todo/di/di.dart';
import 'package:todo/domain/entities/add_todo.dart';
import 'package:todo/domain/entities/delete_entity.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/entities/update_todo.dart';
import 'package:todo/domain/interfaces/todo/I_todo_repo.dart';
import 'package:todo/domain/use_cases/todo/todo_usecase.dart';
import 'package:todo/services/notificationService/notification_service.dart';
import 'package:todo/ui/base/base_state.dart';
import 'package:todo/ui/base/base_view_model.dart';

class TodoViewModel extends BaseViewModel {
  late ITodoRepo todoRepo;
  late TodoModel _todoModel;

  double _remainingDays = 0;
  int _status = 2;

  TodoViewModel() {
    todoRepo = inject<ITodoRepo>();
    _todoModel = TodoModel();
  }

  // Data init
  init(Result result) async {
    await fetchTodo(TodoEntity(limit: '10', skip: '1'), result);
  }

  BaseLoadingState _loadingState = BaseLoadingState.none;

  set loadingState(BaseLoadingState value) {
    _loadingState = value;
    setState();
  }

  set setStatus(int studentStatus) {
    _status = studentStatus;
    setState();
  }

  set setRemainingDays(int days) {
    _remainingDays = days.toDouble();
    setState();
  }

  BaseLoadingState get loadingState => _loadingState;
  TodoModel get todoModel => _todoModel;
  double get remainingDays => _remainingDays;
  int get status => _status;

  // Fetch Todo Data
  Future<void> fetchTodo(TodoEntity todoEntity, Result result) async {
    loadingState = BaseLoadingState.loading;
    TodoUseCase todoUseCase = TodoUseCase(todoRepo);
    final response = await todoUseCase(todoEntity);
    response.fold((error) {
      loadingState = BaseLoadingState.error;

      result.onError(error);
      d(ErrorMessage.fromError(error));
    }, (response) {
      d(response);

      _todoModel = response;
      setState();

      result.onSuccess('fetch');

      // return response.todos;
      // _attendanceModel = response;

      loadingState = BaseLoadingState.succeed;
    });
    // return _todoModel.todos ?? <Todos>[];
  }

  //  Add Todo Data
  Future<void> addTodo(AddTodoEntity addTodoEntity, Result result) async {
    loadingState = BaseLoadingState.loading;
    AddTodoUseCase addTodoUseCase = AddTodoUseCase(todoRepo);
    final response = await addTodoUseCase(addTodoEntity);
    response.fold((error) {
      loadingState = BaseLoadingState.error;

      result.onError(error);
      d(ErrorMessage.fromError(error));
    }, (response) {
      d(response);

      // _todoModel = response;
      setState();
      // return response.todos;
      // _attendanceModel = response;

      loadingState = BaseLoadingState.succeed;
      result.onSuccess('add');
    });
    // return _todoModel.todos ?? <Todos>[];
  }

  //  Update Todo Data
  Future<void> updateTodo(UpdateTodoEntity updateTodoEntity, Result result) async {
    loadingState = BaseLoadingState.loading;
    UpdateTodoUseCase updateTodoUseCase = UpdateTodoUseCase(todoRepo);
    final response = await updateTodoUseCase(updateTodoEntity);
    response.fold((error) {
      loadingState = BaseLoadingState.error;

      result.onError(error);
      d(ErrorMessage.fromError(error));
    }, (response) {
      d(response);

      // _todoModel = response;
      setState();
      // return response.todos;
      // _attendanceModel = response;

      loadingState = BaseLoadingState.succeed;
      result.onSuccess('update');
    });
    // return _todoModel.todos ?? <Todos>[];
  }

  //  Delete Todo Data
  Future<void> deleteTodo(DeleteTodoEntity deleteTodoEntity, Result result) async {
    loadingState = BaseLoadingState.loading;
    DeleteTodoUseCase deleteTodoUseCase = DeleteTodoUseCase(todoRepo);
    final response = await deleteTodoUseCase(deleteTodoEntity);
    response.fold((error) {
      loadingState = BaseLoadingState.error;

      result.onError(error);
      d(ErrorMessage.fromError(error));
    }, (response) {
      d(response);

      // _todoModel = response;
      setState();
      // return response.todos;
      // _attendanceModel = response;

      loadingState = BaseLoadingState.succeed;
      result.onSuccess("delete");
    });
    // return _todoModel.todos ?? <Todos>[];
  }
}
