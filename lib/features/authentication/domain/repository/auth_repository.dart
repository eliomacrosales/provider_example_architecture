import 'package:bac_architecture/commons/models/user.dart';

abstract class AuthRepository {
  Future<User> loginUser({required User user});
}
