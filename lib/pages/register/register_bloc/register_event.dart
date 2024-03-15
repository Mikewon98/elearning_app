part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameRegisterEvent extends RegisterEvent {
  final String userName;
  const UserNameRegisterEvent(this.userName);
}

class EmailRegisterEvent extends RegisterEvent {
  final String email;
  const EmailRegisterEvent(this.email);
}

class PasswordRegisterEvent extends RegisterEvent {
  final String password;
  const PasswordRegisterEvent(this.password);
}

class ConfirmPasswordRegisterEvent extends RegisterEvent {
  final String confirmPassword;
  const ConfirmPasswordRegisterEvent(this.confirmPassword);
}
