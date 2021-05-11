import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'amplifyconfiguration.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
LoginData _data;
  Future<String> _onLogin(BuildContext context , LoginData data) async{
    print(data);
  }

  Future<String> _onSignup(BuildContext context , LoginData data) async{
    try{
      await Amplify.Auth.signUp(
          username: data.name,
          password: data.password,
        options: CognitoSignUpOptions(userAttributes: {
          'email' : data.name,
        }),
      );
      _data = data;
    }  catch(e){
        return 'There was a problem with sigining up. Please, try again.';
    }
  }

Future<String> _onRecoverPassword(BuildContext context, String email) async {
  try {
    final res = await Amplify.Auth.resetPassword(username: email);

    if (res.nextStep.updateStep == 'CONFIRM_RESET_PASSWORD_WITH_CODE') {
      Navigator.of(context).pushReplacementNamed(
        '/confirm-reset',
        arguments: LoginData(name: email, password: ''),
      );
    }
  } on AuthException catch (e) {
    return '${e.message} - ${e.recoverySuggestion}';
  }
}

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'SalonEverywhere',
      onLogin: (LoginData data) => _onLogin(context, data),
      onRecoverPassword: (String email) => _onRecoverPassword(context, email),
      onSignup: (LoginData data) => _onSignup(context, data),
      theme: LoginTheme(
        primaryColor: Theme.of(context).primaryColor,
      ),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed('/confirm' , arguments: _data);
      },
    );
  }
}
