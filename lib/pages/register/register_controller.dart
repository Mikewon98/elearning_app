import "dart:developer" show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningapp/common/values/constant.dart';
import 'package:learningapp/common/widget/flutter_toast.dart';
import 'package:learningapp/pages/register/register_bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  void handleRegister() async {
    final state = context.read<RegisterBloc>().state;
    log("$state");

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: "Confirm Password can not be empty");
      return;
    }

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        credential.user!.updateDisplayName(userName);
        String photoUrl = "${AppConstants.SERVER_API_URL}/uploads/defaut.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(msg: "An email verification has been sent, please verify!");

        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('weak-password');
        toastInfo(msg: "Weak password");
      } else if (e.code == "email-already-in-use") {
        log('email-already-in-use');
        toastInfo(msg: "The email provided is already registered");
      } else if (e.code == 'invalid-email') {
        log('invalid-email');
        toastInfo(msg: "Invalid Email");
      }
      log("Error, $e");
    }
  }
}
