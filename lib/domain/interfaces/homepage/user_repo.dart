import 'package:dartz/dartz.dart';
import 'package:todo/application/core/failure/failure.dart';
import 'package:todo/data/models/auth/login_model.dart';
import 'package:todo/domain/entities/auth_entity.dart';

abstract class IAuthRepo {
  Future<Either<Failure, AuthModel>> userLogin(AuthEntity params);
}
