import 'package:bac_architecture/commons/models/user.dart';
import 'package:bac_architecture/commons/network_connection/network_service.dart';
import 'package:bac_architecture/features/authentication/domain/repository/auth_repository.dart';

class AuthenticationRepositoryImpl extends AuthRepository {
  final NetworkService networkService;

  AuthenticationRepositoryImpl(this.networkService);

  @override
  Future<User> loginUser({required User user}) async {
    try {
      final response = await networkService.post(
        '/users',
        data: user.toJson(),
      );
    final usuario = User.fromJson(response.data);
      return usuario;
    }  catch (e) {
      rethrow;
    }
  }
}
