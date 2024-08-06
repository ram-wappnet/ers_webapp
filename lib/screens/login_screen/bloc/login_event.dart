part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends LoginEvent {}

class ToggleEvent extends LoginEvent {}

class TogglePasswordVisibility extends LoginEvent {}
