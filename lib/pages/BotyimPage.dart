//import 'package:botyim/screens/landing_page.dart';
import 'package:botyim/pages/Chatterscreen.dart';
import 'package:flutter/material.dart';

class BotyimPage extends StatefulWidget {
  BotyimPage({Key key}) : super(key: key);

  @override
  _BotyimPageState createState() => _BotyimPageState();
}

class _BotyimPageState extends State<BotyimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Chatterscreen(),
      ),
    );
  }
}
//LandingPage(),
