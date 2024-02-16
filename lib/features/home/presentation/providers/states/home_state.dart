import 'package:bac_architecture/commons/exceptions/app_exception.dart';
import 'package:bac_architecture/commons/models/user.dart';
import 'package:equatable/equatable.dart';


sealed class HomeState  extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final List<User> users;

  HomeStateSuccess({required this.users});

  @override
  List<Object?> get props => [users];
}

class HomeStateFailure extends HomeState {
  final AppException exception;

  HomeStateFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
