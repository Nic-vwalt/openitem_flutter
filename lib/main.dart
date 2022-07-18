
import 'package:flutter/material.dart';
import 'package:openitem_flutter/constants/global_variables.dart';
import 'package:openitem_flutter/features/auth/screens/auth_screen.dart';
import 'package:openitem_flutter/features/auth/services/auth_service.dart';
import 'package:openitem_flutter/features/home/screens/home_screen.dart';
import 'package:openitem_flutter/providers/user_provider.dart';
import 'package:openitem_flutter/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider(),),
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ? const HomeScreen() : const AuthScreen(),
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.dark(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: GlobalVariables.monochromatic,
              ))),
    );
  }
}
