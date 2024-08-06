import 'dart:developer';

import '../../../data/login_response_model.dart';
import '../../../export.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>(
    debugLabel: "Key1",
  );
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(
      (event, emit) => _onSubmitted(event, emit),
    );
    on<TogglePasswordVisibility>((event, emit) {
      log("$state");
      if (state is PasswordVisibilityState) {
        final currentState = state as PasswordVisibilityState;

        emit(currentState.copyWith(
          isPasswordVisible: !currentState.isPasswordVisible,
        ));
        log(currentState.isPasswordVisible.toString());
      } else {
        emit(const PasswordVisibilityState(isPasswordVisible: true));
      }
    });
  }

  Future<void> _onSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      emit(LoginSuccess(user: User(id: "4", username: "Ram")));
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
