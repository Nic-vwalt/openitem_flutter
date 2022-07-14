import 'package:flutter/material.dart';
import 'package:openitem_flutter/constants/global_variables.dart';
import 'package:openitem_flutter/features/auth/screens/auth_screen.dart';
import 'package:openitem_flutter/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Navigator(
        key: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) => generateRoute(settings),
        initialRoute: AuthScreen.routeName,
      ),
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.dark(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ))),
    );
  }
}
