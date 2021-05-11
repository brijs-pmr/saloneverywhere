
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'amplifyconfiguration.dart';
import 'login.dart';
import 'package:amplify_core/amplify_core.dart';

class EmptyScreen extends StatefulWidget {
  @override
  _EmptyScreenState createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  bool _amplifyConfigured = false;

  @override
  void initState(){
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async{
    final auth = AmplifyAuthCognito();
    final analytics = AmplifyAnalyticsPinpoint();

    try{
      Amplify.addPlugins([auth,analytics]);

      await Amplify.configure(amplifyconfig);

      setState(() {
        _amplifyConfigured = true;
      });
    }catch(e){
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: _amplifyConfigured ? Login() : CircularProgressIndicator(),
      ),
    );
  }


}
