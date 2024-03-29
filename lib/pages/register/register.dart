import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learningapp/pages/common_widgets.dart';
import 'package:learningapp/pages/register/register_bloc/register_bloc.dart';
import 'package:learningapp/pages/register/register_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: reusableText(
                          "Enter your details below and free sign up"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User name"),
                          buildTextField("Enter your user name", false, "user",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(UserNameRegisterEvent(value));
                          }),
                          reusableText("Email"),
                          buildTextField(
                              "Enter your email address", false, "user",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(EmailRegisterEvent(value));
                          }),
                          reusableText("Password"),
                          buildTextField("Enter your passwords", true, "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordRegisterEvent(value));
                          }),
                          reusableText("Confirm password"),
                          buildTextField("Confirm your password", true, "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(ConfirmPasswordRegisterEvent(value));
                          }),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reusableText(
                          "By creating an account you have to agree with our term and conditions."),
                    ),
                    buildLoginAndRegisterButton(
                      "Sign Up",
                      "login",
                      () {
                        RegisterController(context: context).handleRegister();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
