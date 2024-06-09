import 'package:todo/application/core/result.dart';
import 'package:todo/application/network/error_handler/error_handler.dart';
import 'package:todo/common/logger/log.dart';
import 'package:todo/data/models/auth/login_model.dart';
import 'package:todo/di/di.dart';
import 'package:todo/domain/entities/auth_entity.dart';
import 'package:todo/domain/interfaces/homepage/user_repo.dart';
import 'package:todo/domain/use_cases/auth/auth_usecase.dart';
import 'package:todo/ui/base/base_state.dart';
import 'package:todo/ui/base/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  late IAuthRepo iAuthRepo;
  late AuthModel _authModel;

  AuthViewModel() {
    iAuthRepo = inject<IAuthRepo>();
    _authModel = AuthModel();
  }

  BaseLoadingState _loadingState = BaseLoadingState.none;

  set loadingState(BaseLoadingState value) {
    _loadingState = value;
    setState();
  }

  BaseLoadingState get loadingState => _loadingState;

  AuthModel get authModel => _authModel;

  Future<bool> userLogin(AuthEntity param, Result<AuthModel> result) async {
    loadingState = BaseLoadingState.loading;
    // setState();
    AuthUseCase userLoginsUseCase = AuthUseCase(iAuthRepo);
    final allProduct = await userLoginsUseCase(param);
    allProduct.fold((error) {
      loadingState = BaseLoadingState.error;

      result.onError(error);
      d(ErrorMessage.fromError(error));
      return false;
    }, (response) {
      d(response);
      _authModel = response;
      // inject<IPrefHelper>().saveUser(response);
      // inject<IPrefHelper>().setProfilePic(response.data!.profilePhoto!);
      // inject<IPrefHelper>().saveToken(response.data!.token!);
      loadingState = BaseLoadingState.succeed;
      result.onSuccess(response);
      return true;
    });
    return false;
  }
}
