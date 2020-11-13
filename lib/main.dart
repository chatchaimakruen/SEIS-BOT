//import 'package:botyim/model/slider.dart';
import 'package:botyim/pages/About.dart';
import 'package:botyim/pages/BotyimPage.dart';
import 'package:botyim/pages/Cause.dart';
import 'package:botyim/pages/Chatterscreen.dart';
import 'package:botyim/pages/Homepage.dart';
import 'package:botyim/pages/LoginPage.dart';
import 'package:botyim/pages/RegisterPage.dart';
import 'package:botyim/pages/SplashScreen.dart';
import 'package:botyim/pages/branch.dart';
import 'package:botyim/pages/myresetpassword.dart';
import 'package:botyim/pages/slide.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dialogflow/dialogflow_v2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BotYim',
      theme: ThemeData(
        //primarySwatch: Colors.green,
        primaryColor: Colors.white,
        accentColor: Colors.blue.shade100,
        canvasColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.green, fontSize: 40),
        ),
      ),
      //home: HomePage(),
      initialRoute: ('/splashscreen'),
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPagePage(),
        '/botyim': (context) => BotyimPage(),
        '/slide': (context) => Slide(),
        '/cause': (context) => Cause(),
        '/chatterscreen': (context) => Chatterscreen(),
        '/splashscreen': (context) => SplashScreen(),
        '/resetpassword': (context) => MyResetPasswordPage(),
        '/branch': (context) => Branch(),
        '/about': (context) => About(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
