import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:salon_everywhere/confirm.dart';
import 'entry.dart';
import 'confirm.dart';
import 'dashboard.dart';
import 'resetpassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      onGenerateRoute: (settings){
        if(settings.name == '/confirm'){
          return PageRouteBuilder(pageBuilder: (_, __, ___) => ConfirmScreen(data: settings.arguments as LoginData),
          transitionsBuilder: (_, __, ___, child) => child);
        }

        if(settings.name == '/confirm-reset'){
          return PageRouteBuilder(pageBuilder: (_, __, ___) => ConfirmResetScreen(data: settings.arguments as LoginData),
              transitionsBuilder: (_, __, ___, child) => child);
        }

        if(settings.name == '/dashbord'){
          return PageRouteBuilder(pageBuilder: (_, __, ___) => DashboardScreen(),
              transitionsBuilder: (_, __, ___, child) => child);
        }
       return MaterialPageRoute(builder: (_) => EmptyScreen());
      },
    );
  }
}

