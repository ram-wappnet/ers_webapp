part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class PasswordVisibilityState extends LoginState {
  final bool isPasswordVisible;

  const PasswordVisibilityState({this.isPasswordVisible = false});

  PasswordVisibilityState copyWith({bool? isPasswordVisible}) {
    return PasswordVisibilityState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object> get props => [isPasswordVisible];
}
