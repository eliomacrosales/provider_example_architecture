import 'package:bac_architecture/commons/di/dio_network_service_provider.dart';
import 'package:bac_architecture/commons/network_connection/network_service.dart';
import 'package:bac_architecture/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:bac_architecture/features/authentication/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final authRepositoryProvider = Provider<AuthRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(networkServiceProvider);
    return AuthenticationRepositoryImpl(networkService);
  },
);
