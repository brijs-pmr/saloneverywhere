import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'amplifyconfiguration.dart';

class ConfirmScreen extends StatefulWidget {
  final LoginData data;

  ConfirmScreen({@required this.data});
  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final _controller = TextEditingController();
  bool _isEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener(() {
    setState(() {
      _isEnabled = _controller.text.isNotEmpty;
    });
    });
  }

  void _resendCode(BuildContext context,LoginData data)async{
    try{
      await Amplify.Auth.resendSignUpCode(username: data.name);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor:Colors.red,
        content : Text('Confirmation code Resent. Check your Email.',
        style: TextStyle(fontSize: 15)),
      ),
      );
    }catch(e){

    }
  }

  void _verifyCode(BuildContext context, LoginData data, String code) async{
    try{
        final res = await Amplify.Auth.confirmSignUp(username: data.name, confirmationCode: code,);
        if(res.isSignUpComplete){
          await Amplify.Auth.signIn(username: data.name, password: data.password);
          Navigator.pushReplacementNamed(context, '/dashbord');
        }
    }catch(e){

    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.all(30),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Enter Confirmation Code',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            )
                        ),
                      ),
                      SizedBox(height: 30),
                      MaterialButton(onPressed:_isEnabled ? () {
                        _verifyCode(context, widget.data,_controller.text);
                      }: null,
                      elevation: 4,
                      color: Theme.of(context).primaryColor,
                        disabledColor: Colors.red.shade200,
                        child: Text(
                          'VERIFY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                        ),
                      ),
                      MaterialButton(onPressed: () {
                        _resendCode(context, widget.data);
                      },
                        child: Text(
                          'Resend Code',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
