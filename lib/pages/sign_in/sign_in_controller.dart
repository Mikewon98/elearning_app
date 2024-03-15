import 'package:flutter/material.dart';
import 'dart:developer' show log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learningapp/common/apis/user_api.dart';
import 'package:learningapp/common/entities/entities.dart';
import 'package:learningapp/common/values/constant.dart';
import 'package:learningapp/common/widget/flutter_toast.dart';
import 'package:learningapp/pages/global.dart';
import 'package:learningapp/pages/sign_in/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        // Instead of context.read() we can also use BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {
          toastInfo(msg: "You need to fill your email");
          return;
        }

        if (password.isEmpty) {
          toastInfo(msg: "You need to fill your password");
          return;
        }

        log("Email is $email and password is $password");
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          if (credential.user == null) {
            toastInfo(msg: "User does not exist");
            return;
          }

          if (!credential.user!.emailVerified) {
            toastInfo(msg: "Email is not verified");
            return;
          }

          var user = credential.user;

          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            //type 1 is email login
            loginRequestEntity.type = 1;

            log("user exist");
            asyncPostAllData(loginRequestEntity);

            Global.storageService.setString(
              AppConstants.STORAGE_USER_TOKEN_KEY,
              "12345678",
            );
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //   '/application',
            //   (route) => false,
            // );

            // We got verified user from firebase
          } else {
            toastInfo(msg: "No user");
            log("no user");
            return;
            // We have error getting user form firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            log('invalid email');
            toastInfo(msg: "Invalid Email");
          } else if (e.code == "user-not-found") {
            log('user-not-found');
            toastInfo(msg: "User not found");
          } else if (e.code == 'wrong-password') {
            log('Worng password provided for that user');
            toastInfo(msg: "Wrong password");
          }
          log("Error, $e");
        }
      }
    } catch (e) {
      log("Error, $e");
    }
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    var result = await UserAPI.login(params: loginRequestEntity);
  }
}
