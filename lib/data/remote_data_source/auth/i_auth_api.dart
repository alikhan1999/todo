import 'package:todo/data/models/auth/login_model.dart';
import 'package:todo/domain/entities/auth_entity.dart';

abstract class IAuthApi {
  Future<AuthModel> userLogin(AuthEntity params);
}
