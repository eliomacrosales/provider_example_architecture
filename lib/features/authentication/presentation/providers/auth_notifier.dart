import 'package:bac_architecture/commons/exceptions/app_exception.dart';
import 'package:bac_architecture/commons/models/user.dart';
import 'package:bac_architecture/features/authentication/domain/repository/auth_repository.dart';
import 'package:bac_architecture/features/authentication/presentation/providers/states/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<HomeState> {
  final AuthRepository authRepository;

  AuthNotifier({
    required this.authRepository,
  }) : super(AuthStateInitial());

  Future<void> loginUser(String username, String password) async {
    state = AuthStateLoading();
    try {
      final user = await authRepository.loginUser(
        user: User(userName: username, pass: password),
      );
      state = AuthStateSuccess(user: user);
    } catch (e) {
      state = AuthStateFailure(exception: e as AppException);
    }
  }
}
