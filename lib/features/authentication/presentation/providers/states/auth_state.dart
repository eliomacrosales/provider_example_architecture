import 'package:bac_architecture/commons/exceptions/app_exception.dart';
import 'package:bac_architecture/commons/models/user.dart';
import 'package:equatable/equatable.dart';

/// propuesta con el paquete freezed para codigo autogenerado
// @freezed
// abstract class AuthState with _$AuthState {
//   const factory AuthState.initial() = Initial;
//   const factory AuthState.loading() = Loading;
//   const factory AuthState.failure(AppException exception) = Failure;
//   const factory AuthState.success() = Success;
// }


sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends HomeState {}

class AuthStateLoading extends HomeState {}

class AuthStateSuccess extends HomeState {
  final User user;

  AuthStateSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthStateFailure extends HomeState {
  final AppException exception;

  AuthStateFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
