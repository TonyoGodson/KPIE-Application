
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../shared/not_fount_screen.dart';
import '../../views/login_screen.dart';
import '../../views/password_screen.dart';
import '../../views/sign_up_screen.dart';


Route<dynamic> generateRoute(RouteSettings settings){
  var args = settings.arguments;
  switch (settings.name){



    case SignUpScreen.routeName:
      return _pageBuilder(
              (context) => SignUpScreen(),
          settings: settings);

    case LoginScreen.routeName:
      return _pageBuilder(
              (context) => LoginScreen(),
          settings: settings);

    case PasswordScreen.routeName:
      return _pageBuilder(
              (context) => PasswordScreen(),
          settings: settings);



    default:
      print("Page doesn't exist");
      return _pageBuilder(
          (_) => const NotFountScreen(),
          settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
    Widget Function(BuildContext) page, {
      required RouteSettings settings,
 }) {
  return PageRouteBuilder(
      settings: settings,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      pageBuilder: (context, _, __) => page(context),
  );
}