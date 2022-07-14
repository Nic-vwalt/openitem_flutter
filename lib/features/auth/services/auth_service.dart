import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:openitem_flutter/constants/error_handling.dart';
import 'package:openitem_flutter/constants/global_variables.dart';
import 'package:openitem_flutter/constants/utils.dart';
import '../../../models/user.dart';

class AuthService {
  // sign up user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        name: '',
        email: email,
        password: password,
        address: '',
        phone: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
        );
        httpErrorHandle(response: res, context: context, onSuccess: () {
          showSnackBar(context, 'Logged In Successfully');
        });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
