import 'package:bac_architecture/commons/di/dio_network_service_provider.dart';
import 'package:bac_architecture/commons/network_connection/network_service.dart';
import 'package:bac_architecture/features/home/data/repositories/home_repository_impl.dart';
import 'package:bac_architecture/features/home/domain/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(networkServiceProvider);
    return HomeRepositoryImpl(networkService);
  },
);
