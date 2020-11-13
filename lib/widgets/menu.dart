import 'package:botyim/widgets/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String login = '...';

// Method
  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('SEIS_BOT_V1.0.0'),
          content: Text('DEV BY MR.CHATCHAI MAKRUEN Software Engineering 60'),
          //actions: <Widget>[cancelButton(), okButton()],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      login = firebaseUser.displayName;
    });
  }

  Widget showLogin() {
    return Text('Login by $login');
  }

  Widget showAppName() {
    return Text(
      'SEIS-BOT',
      style: TextStyle(
        color: Colors.blue.shade700,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }

  Widget showHead() {
    return DrawerHeader(
      decoration: BoxDecoration(),
      child: Column(
        children: <Widget>[
          Logo(),
          showAppName(),
          SizedBox(height: 6.0),
          showLogin(),
        ],
      ),
    );
  }

  Widget showList() {
    return ListTile(
        leading: Icon(Icons.book, size: 30.0, color: Colors.blueAccent),
        title: Text('หลักสูตร', style: TextStyle(color: Colors.black)),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              '/cause', (Route<dynamic> route) => false);
        });
  }

  Widget showList1() {
    return ListTile(
        leading: Icon(Icons.airplay, size: 30.0, color: Colors.blueAccent),
        title: Text('เเนะนำสาขาวิชา', style: TextStyle(color: Colors.black)),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              '/branch', (Route<dynamic> route) => false);
        });
  }

  Widget showList2() {
    return ListTile(
        leading: Icon(Icons.add_location, size: 30.0, color: Colors.blueAccent),
        title: Text('เกี่ยวกับ', style: TextStyle(color: Colors.black)),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              '/about', (Route<dynamic> route) => false);
        });
  }

  Widget showAboutList() {
    return ListTile(
      leading: Icon(Icons.settings, size: 30.0, color: Colors.redAccent),
      title: Text('ผู้พัฒนา'),
      onTap: () {
        Navigator.of(context).pop();
        myAlert();
      },
    );
  }

  Widget cancelButton() {
    return FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget okButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            showHead(),
            showList(),
            showList1(),
            showList2(),
            showAboutList(),
          ],
        ),
      ),
    );
  }
}
