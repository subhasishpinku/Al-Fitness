import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:aifitness/view/get_start_screen.dart';
import 'package:aifitness/view/login_screen.dart';
import 'package:aifitness/view/signin_screen.dart';
import 'package:aifitness/view/signin_screen_eight.dart';
import 'package:aifitness/view/signin_screen_fifth.dart';
import 'package:aifitness/view/signin_screen_fourth.dart';
import 'package:aifitness/view/signin_screen_ninth.dart';
import 'package:aifitness/view/signin_screen_second.dart';
import 'package:aifitness/view/signin_screen_seventh.dart';
import 'package:aifitness/view/signin_screen_sixth.dart';
import 'package:aifitness/view/signin_screen_tenth.dart';
import 'package:aifitness/view/signin_screen_third.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.getStartScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const GetStartScreen(),
        );
      case (RouteNames.signinScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreen(),
        );
      case (RouteNames.signinScreenSecond):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenSecond(),
        );
      case (RouteNames.signinScreenThird):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenThird(),
        );
      case (RouteNames.signinScreenFourth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenFourth(),
        );
      case (RouteNames.signinScreenFifth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenFifth(),
        );
      case (RouteNames.signinScreenSixth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenSixth(),
        );
      case (RouteNames.signinScreenSeventh):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenSeventh(),
        );
        case (RouteNames.signinScreenEight):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenEight(),
        );
         case (RouteNames.signinScreenNinth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenNinth(),
        );
        case (RouteNames.signinScreenTenth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenTenth(),
        );
        case (RouteNames.loginScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No route is configured")),
          ),
        );
    }
  }
}
