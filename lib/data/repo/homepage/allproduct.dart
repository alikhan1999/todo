import 'package:dartz/dartz.dart';
import 'package:todo/application/core/failure/failure.dart';
import 'package:todo/application/network/error_handler/error_handler.dart';
import 'package:todo/data/models/auth/login_model.dart';
import 'package:todo/data/remote_data_source/auth/i_auth_api.dart';
import 'package:todo/domain/entities/auth_entity.dart';
import 'package:todo/domain/interfaces/homepage/user_repo.dart';

class AuthRepo implements IAuthRepo {
  AuthRepo({required this.api});
  IAuthApi api;

  @override
  Future<Either<Failure, AuthModel>> userLogin(AuthEntity params) async {
    try {
      final result = await api.userLogin(params);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }
}
