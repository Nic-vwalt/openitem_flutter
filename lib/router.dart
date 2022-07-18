import 'package:flutter/material.dart';
import 'package:openitem_flutter/features/admin/screens/admin_screen.dart';
import 'package:openitem_flutter/features/auth/screens/auth_screen.dart';
import 'package:openitem_flutter/features/home/screens/home_screen.dart';
import 'package:openitem_flutter/features/visitor/screens/visitor_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
    case AdminScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AdminScreen());
    case VisitorScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const VisitorScreen());
    // case SettingScreen.routeName:
    //   return MaterialPageRoute(
    //       settings: routeSettings, builder: (_) => const SettingScreen());
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Page does not exist'),
                ),
              ));
  }
}
