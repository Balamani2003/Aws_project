import 'package:flutter/material.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_login/flutter_login.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginData _data;
  Future<String?> _onLogin(BuildContext context, LoginData data) async {

    try {
      SignInResult result = await Amplify.Auth.signIn(
        username: data.name,
        password: data.password,
      );

      return null;
    } on AuthException catch (e) {
      print('Error logging in: $e');
      return 'Invalid credentials';
    }
  }

  Future<String?> _onSignup(BuildContext context, SignupData data) async {
    try {
      await Amplify.Auth.signUp(
        username: data.name!,
        password: data.password!,

        options: CognitoSignUpOptions(
            userAttributes: {
              CognitoUserAttributeKey.email: data.name!,
            }),
      );

      _data=data as LoginData;

    } on AuthException catch (e) {
      if (e.message.contains("USERNAME_EXISTS")) {
        return 'Username already exists. Please choose a different username.';
      }
      return 'There was a problem signing up. Please try again';
    }
  }


  @override
  Widget build(BuildContext context) {
    return FlutterLogin(onLogin: (LoginData data) => _onLogin(context, data),
      onRecoverPassword: (_) => Future.value(" "),
      onSignup: (SignupData data) => _onSignup(context, data),
      theme: LoginTheme(
        primaryColor: Theme
            .of(context)
            .primaryColor,
      ),
      onSubmitAnimationCompleted: () {
      Navigator.of(context).pushReplacementNamed("/confirm",arguments: _data);
      },);
  }
}

