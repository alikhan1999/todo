import 'package:dio/dio.dart';
import 'package:todo/application/core/exception/exception.dart';
import 'package:todo/application/network/error_handler/error_handler.dart';
import 'package:todo/application/network/remote_client/iApService.dart';
import 'package:todo/data/models/auth/login_model.dart';
import 'package:todo/data/remote_data_source/auth/i_auth_api.dart';
import 'package:todo/domain/entities/auth_entity.dart';

class AuthApi implements IAuthApi {
  AuthApi(IApiService api) {
    api.setIsTokenRequired(true);
    _dio = api.get();
  }

  @override
  Future<AuthModel> userLogin(AuthEntity params) async {
    try {
      final res = await _dio.post('auth/login', data: params.toJson());
      return AuthModel.fromJson(res.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  late Dio _dio;
}
