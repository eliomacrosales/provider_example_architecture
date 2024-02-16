import 'package:bac_architecture/commons/models/user.dart';

abstract class HomeRepository {
  Future<List<User>> getUsers();
}
