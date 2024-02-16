import 'package:bac_architecture/commons/exceptions/app_exception.dart';
import 'package:bac_architecture/features/home/domain/repository/home_repository.dart';
import 'package:bac_architecture/features/home/presentation/providers/states/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





// class HomeNotifier extends StateNotifier<HomeState> {
//   final HomeRepository homeRepository;
//
//   HomeNotifier({
//     required this.homeRepository,
//   }) : super(HomeInitial());
//
//   Future<void> getUsers() async {
//     state = HomeLoading();
//     try {
//       final users = await homeRepository.getUsers();
//       state = HomeStateSuccess(users: users);
//     } catch (e) {
//       state = HomeStateFailure(exception: e as AppException);
//     }
//   }
// }
