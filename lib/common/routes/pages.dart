import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningapp/common/routes/names.dart';
import 'package:learningapp/pages/application/app_bloc/app_bloc.dart';
import 'package:learningapp/pages/application/application_page.dart';
import 'package:learningapp/pages/global.dart';
import 'package:learningapp/pages/home/home_page.dart';
import 'package:learningapp/pages/home/home_page_bloc/home_page_bloc.dart';
import 'package:learningapp/pages/profile/settings/settings_bloc/settings_bloc.dart';
import 'package:learningapp/pages/profile/settings/settings_page.dart';
import 'package:learningapp/pages/register/register.dart';
import 'package:learningapp/pages/register/register_bloc/register_bloc.dart';
import 'package:learningapp/pages/sign_in/sign_in.dart';
import 'package:learningapp/pages/sign_in/sign_in_bloc/sign_in_bloc.dart';
import 'package:learningapp/pages/welcome/welcome.dart';
import 'package:learningapp/pages/welcome/welcome_bloc/welcome_bloc.dart';

// unify blocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomePageBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.Settings_PAGE,
        page: const SettingsPage(),
        bloc: BlocProvider(
          create: (_) => SettingsBloc(),
        ),
      ),
    ];
  }

  // return all bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    // creating local variable blocProviders
    for (var bloc in routes()) {
      // blocProviders.add(bloc.bloc);
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  // A model that covers entire screen as we click on navigator object
  static MaterialPageRoute genereteRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where(
        (element) => element.route == settings.name,
      );
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        bool isLoggedIn = Global.storageService.getIsLoggedIn();

        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          if (isLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => const ApplicationPage(),
              settings: settings,
            );
          }
          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        }

        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    // print("Invalid route name ${settings.name}");
    return MaterialPageRoute(
      builder: (_) => const SignIn(),
      settings: settings,
    );
  }
}
