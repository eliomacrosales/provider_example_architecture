import 'package:bac_architecture/features/authentication/domain/repository/auth_repository.dart';
import 'package:bac_architecture/features/authentication/presentation/providers/auth_notifier.dart';
import 'package:bac_architecture/features/authentication/presentation/providers/di/auth_repository_provider.dart';
import 'package:bac_architecture/features/authentication/presentation/providers/states/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, HomeState>(
  (ref) {
    final AuthRepository authenticationRepository =
        ref.watch(authRepositoryProvider);
    return AuthNotifier(
      authRepository: authenticationRepository
    );
  },
);
