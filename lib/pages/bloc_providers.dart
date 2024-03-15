import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningapp/pages/register/register_bloc/register_bloc.dart';
import 'package:learningapp/pages/sign_in/sign_in_bloc/sign_in_bloc.dart';
import 'package:learningapp/pages/welcome/welcome_bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (contex) => RegisterBloc(),
        )
      ];
}
