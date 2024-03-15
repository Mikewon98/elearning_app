import 'dart:async';

import 'package:bloc/bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UserNameRegisterEvent>(_userNameRegisterEvent);
    on<EmailRegisterEvent>(_emailRegisterEvent);
    on<PasswordRegisterEvent>(_passwordRegisterEvent);
    on<ConfirmPasswordRegisterEvent>(_confirmPasswordRegisterEvent);
  }

  FutureOr<void> _userNameRegisterEvent(
      UserNameRegisterEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  FutureOr<void> _emailRegisterEvent(
      EmailRegisterEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordRegisterEvent(
      PasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _confirmPasswordRegisterEvent(
      ConfirmPasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
