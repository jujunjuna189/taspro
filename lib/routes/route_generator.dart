import 'package:flutter/material.dart';
import 'package:taspro/screens/auth/auth_screen.dart';
import 'package:taspro/screens/auth/login_screen.dart';
import 'package:taspro/screens/auth/register_screen.dart';
import 'package:taspro/screens/home_screen.dart';
import 'package:taspro/screens/intro/intro_screen.dart';
import 'package:taspro/screens/member/member_screen.dart';
import 'package:taspro/screens/project/form_project.dart';
import 'package:taspro/screens/project/project_screen.dart';
import 'package:taspro/screens/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/intro':
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/project':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ProjectScreen(
              data: args,
            ),
          );
        }
        return _errorRoute();
      case '/form_project':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => FormProject(
              data: args,
            ),
          );
        }
        return _errorRoute();
      case '/member':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MemberScreen(
              data: args,
            ),
          );
        }
        return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}