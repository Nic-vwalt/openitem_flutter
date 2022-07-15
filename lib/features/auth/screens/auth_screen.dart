import 'package:flutter/material.dart';
import 'package:openitem_flutter/common/widgets/custom_logo.dart';
import 'package:openitem_flutter/common/widgets/custom_static_bottomnavbar.dart';
import 'package:openitem_flutter/common/widgets/custom_textfield.dart';
import 'package:openitem_flutter/constants/global_variables.dart';
import 'package:openitem_flutter/features/auth/services/auth_service.dart';

import '../../../common/widgets/custom_button.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth_screen';
  const AuthScreen({Key? key}) : super(key: key);
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //init
  Auth _auth = Auth.signin;

  //form keys
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  //controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  //auth service
  final AuthService authService = AuthService();

  //dispose method
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }

  void signInUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        phone: _phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const OpenitemLogo(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    customRadioTile(
                      'Sign in',
                      Auth.signin,
                    ),
                    customRadioTile(
                      'Sign up',
                      Auth.signup,
                    ),
                  ],
                ),
                if (_auth == Auth.signin)
                  //a form with a username and password input field
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 300,
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  controller: _emailController,
                                  hintText: 'Email'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  controller: _passwordController,
                                  hintText: 'Password'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                child: CustomButton(
                                  text: 'Sign In',
                                  onTap: () {
                                    if (_signInFormKey.currentState!
                                        .validate()) {
                                      signInUser();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (_auth == Auth.signup)
                  //a user registration form with input fields for username, password, email, and name
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  controller: _emailController,
                                  hintText: 'Email'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  controller: _passwordController,
                                  hintText: 'Password'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  controller: _nameController,
                                  hintText: 'Name'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  controller: _phoneController,
                                  hintText: 'Phone'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                child: CustomButton(
                                  text: 'Sign Up',
                                  onTap: () {
                                    if (_signUpFormKey.currentState!
                                        .validate()) {
                                      signUpUser();
                                      _auth = Auth.signin;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      //bottomsheet with a image and a text
      bottomNavigationBar: const BottomNavbarLogo(),
    );
  }

  Padding customRadioTile(
    String text,
    Auth val,
  ) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 60,
        width: 150,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(
              color: GlobalVariables.backgroundColor,
              width: 2,
            ),
          ),
          tileColor: GlobalVariables.backgroundColor,
          onTap: () {   
            setState(() {
              _auth = val;
            });
          },
          title: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              fontFamily: 'OpenSans',
            ),
          ),
          leading: Radio(
            activeColor: Colors.white,
            value: val,
            groupValue: _auth,
            onChanged: (Auth? val) {
              setState(() {
                _auth = val!;
              });
            },
          ),
        ),
      ),
    );
  }
}
