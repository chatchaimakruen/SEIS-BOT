//import 'package:botyim/pages/BotyimPage.dart';
//import 'package:botyim/pages/SlidePage.dart';
import 'package:botyim/pages/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool _autovalidate = false;
  bool isLoading = false;
  String emailString, passwordString;
  bool _rememberMe = false;

  Future<void> signinThread() async {
    setState(() {
      isLoading = true;
    });
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success for Email=$emailString');
      MaterialPageRoute materialPageRoute =
          //MaterialPageRoute(builder: (BuildContext context) => SlidePage());
          MaterialPageRoute(builder: (BuildContext context) => Slide());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title =$title, message =$message');
      myAlert(title, message);
    });
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.add_alert,
                color: Colors.red,
                size: 48.0,
              ),
              title: Text(
                title,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.lightBlue.shade100],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Material(
                  elevation: 20.0,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/images/main.gif',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FormBuilder(
                    key: _fbKey,
                    initialValue: {
                      'email': '',
                      'password': '',
                    },
                    autovalidate: _autovalidate,
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          onSaved: (input) {
                            emailString = input;
                          },
                          attribute: "email",
                          maxLines: 1,
                          keyboardType:
                              TextInputType.emailAddress, //รูปแบบคีบอร์ด
                          decoration: InputDecoration(
                              labelText: "Email",
                              icon: Icon(
                                Icons.email,
                                color: Colors.green,
                                size: 40.0,
                              ),
                              labelStyle: TextStyle(color: Colors.black87),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              errorStyle: TextStyle(color: Colors.red)),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'ป้อนข้อมูลอีเมล์ด้วย'),
                            FormBuilderValidators.email(
                                errorText: 'รูปแบบอีเมล์ไม่ถูกต้อง'),
                          ],
                          //onSaved: (value) => _emailString = value,
                        ),
                        SizedBox(height: 20),
                        FormBuilderTextField(
                          onSaved: (input) {
                            passwordString = input;
                          },
                          attribute: "Password",

                          maxLines: 1,
                          obscureText: true,
                          keyboardType:
                              TextInputType.visiblePassword, //รูปแบบคีบอร์ด
                          decoration: InputDecoration(
                              labelText: "Password",
                              icon: Icon(
                                Icons.lock,
                                color: Colors.blue,
                                size: 40.0,
                              ),
                              labelStyle: TextStyle(color: Colors.black87),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              errorStyle: TextStyle(color: Colors.red)),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'ป้อนข้อมูลรหัสผ่านด้วย'),
                            FormBuilderValidators.minLength(3,
                                errorText: 'รูปแบบอีเมล์ไม่ถูกต้อง'),
                          ],
                        ),
                        SizedBox(height: 20),
                        _buildRememberMeCheckbox(),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 200,
                          child: RaisedButton(
                            onPressed: () {
                              if (_fbKey.currentState.saveAndValidate()) {
                                _fbKey.currentState.save();
                                //print('name = $name, ');
                                // Navigator.pushNamedAndRemoveUntil(
                                //     context, '/slide', (route) => false);
                              } else {
                                setState(() {
                                  _autovalidate = true;
                                });
                              }
                              signinThread();
                            },
                            child: Text('Log In',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.lightGreen)),
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                                child: MaterialButton(
                                    child: Text('สมัครสมาชิก',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            decoration:
                                                TextDecoration.underline)),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/register');
                                    })),
                            Expanded(
                                child: MaterialButton(
                                    child: Text('ลืมรหัสผ่าน',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            decoration:
                                                TextDecoration.underline)),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/resetpassword');
                                    })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
