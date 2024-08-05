part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class RequestCodeSuccessState extends AuthState {
  String message;
  RequestCodeSuccessState({required this.message});
}

class RequestCodeErrorState extends AuthState {
  NetworkExceptions error;
  RequestCodeErrorState({required this.error});
}

class RequestCodeLoadingState extends AuthState {}

class VerifyCodeSuccessState extends AuthState {
  UserModel user;
  VerifyCodeSuccessState({required this.user});
}

class VerifyCodeErrorState extends AuthState {
  NetworkExceptions error;
  VerifyCodeErrorState({required this.error});
}

class VerifyCodeLoadingState extends AuthState {}

class FinishTimeState extends AuthState {}

class EditTimeState extends AuthState {}

class PickImageState extends AuthState {}
