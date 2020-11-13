//import 'dart:ffi';

import 'dart:async';
import 'package:botyim/pages/slide.dart';
//import 'package:botyim/pages/Chatterscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key key, this.title}) : super(key: key);
  //final FirebaseUser user;

  //HomePage(this.user, {Key key, this.title}) : super(key: key);

  //final String title;
  //final FirebaseUser user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Slide());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.white, Colors.lightBlue.shade100],
          radius: 1.0,
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/mascos3.png'),
                  //fit: BoxFit.cover,
                  // height: 100,
                ),
                SizedBox(height: 20),
                Text('BOT_YIM',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent)),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      child: Text('เข้าสู่ระบบ',
                          style: TextStyle(
                              fontSize: 20, color: Colors.lightGreen)),
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      child: Text('สมัครสมาชิก',
                          style: TextStyle(
                              fontSize: 20, color: Colors.lightGreen)),
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    )
                  ],
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text('..คุยกับบอท..',
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue)),
                  padding: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/slide');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
