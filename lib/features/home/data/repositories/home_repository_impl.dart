import 'dart:convert';
import 'package:bac_architecture/commons/models/user.dart';
import 'package:bac_architecture/commons/network_connection/network_service.dart';
import 'package:bac_architecture/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final NetworkService networkService;

  HomeRepositoryImpl(this.networkService);

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await networkService.get('/users');
      final parsed = jsonDecode(response.data);
      return parsed.map<User>((json) => User.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
