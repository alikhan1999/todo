import 'package:dartz/dartz.dart';
import 'package:todo/application/core/failure/failure.dart';
import 'package:todo/application/core/usecases/usecase.dart';
import 'package:todo/data/models/auth/login_model.dart';
import 'package:todo/domain/entities/auth_entity.dart';
import 'package:todo/domain/interfaces/homepage/user_repo.dart';

class AuthUseCase implements UseCase<AuthModel, AuthEntity> {
  AuthUseCase(this.repository);
  final IAuthRepo repository;

  @override
  Future<Either<Failure, AuthModel>> call(AuthEntity params) async {
    return repository.userLogin(params);
  }
}
