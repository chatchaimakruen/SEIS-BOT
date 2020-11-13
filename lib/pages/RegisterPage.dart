//import 'package:botyim/pages/SlidePage.dart';
import 'package:botyim/pages/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:intl/intl.dart';

class RegisterPagePage extends StatefulWidget {
  RegisterPagePage({Key key}) : super(key: key);

  @override
  _RegisterPagePageState createState() => _RegisterPagePageState();
}

class _RegisterPagePageState extends State<RegisterPagePage> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  //final formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  String nameString, emailString, passwordString;
  //bool isloading = false;

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success for Email=$emailString');
      setupDisplayName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title =$title, message =$message');
      myAlert(title, message);
    });
  }

  Future<void> setupDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      response.updateProfile(userUpdateInfo);

      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Slide());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
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
                style: TextStyle(color: Colors.red),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text(
          'Register',
          style: TextStyle(fontSize: 20, color: Colors.blueAccent),
        ),
      ),
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
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FormBuilder(
                    key: formKey,
                    initialValue: {
                      'name': '',
                      'email': '',
                      'password': '',
                      //'dob': DateTime.now(),
                    },
                    autovalidate: _autovalidate,
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          onSaved: (input) {
                            nameString = input;
                          },
                          attribute: "ชื่อ-สกุล",
                          maxLines: 1,
                          keyboardType: TextInputType.text, //รูปแบบคีบอร์ด
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.face,
                                color: Colors.purple,
                                size: 48.0,
                              ),
                              labelText: "ชื่อ-สกุล",
                              labelStyle: TextStyle(color: Colors.purple),
                              helperText: 'กรอกชื่อเล่น',
                              helperStyle: TextStyle(
                                  color: Colors.purple,
                                  fontStyle: FontStyle.italic),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              errorStyle: TextStyle(color: Colors.red)),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'กรุณาป้อนชื่อเล่น'),
                          ],
                        ),
                        SizedBox(height: 20),
                        FormBuilderTextField(
                          onSaved: (input) {
                            emailString = input;
                          },
                          attribute: "email",
                          maxLines: 1,
                          keyboardType:
                              TextInputType.emailAddress, //รูปแบบคีบอร์ด
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.green,
                                size: 48.0,
                              ),
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.green),
                              helperText: 'กรอก email',
                              helperStyle: TextStyle(
                                  color: Colors.green,
                                  fontStyle: FontStyle.italic),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              errorStyle: TextStyle(color: Colors.red)),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'กรุณาป้อนข้อมูลอีเมล์'),
                            FormBuilderValidators.email(
                                errorText: 'รูปแบบอีเมล์ไม่ถูกต้อง'),
                          ],
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
                              icon: Icon(
                                Icons.lock,
                                color: Colors.blue,
                                size: 48.0,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.blue),
                              helperText: 'กรอก password 6 charactor',
                              helperStyle: TextStyle(
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              errorStyle: TextStyle(color: Colors.red)),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'กรุณาป้อนข้อมูลรหัสผ่าน'),
                            FormBuilderValidators.minLength(3,
                                errorText: 'รูปแบบอีเมล์ไม่ถูกต้อง'),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 200,
                          child: RaisedButton(
                            onPressed: () {
                              print('You click upload');
                              if (formKey.currentState.saveAndValidate()) {
                                print(
                                    'name = $nameString, email = $emailString, password = $passwordString');
                                // Navigator.pushNamedAndRemoveUntil(
                                //     context, '/slide', (route) => false);
                              } else {
                                setState(() {
                                  _autovalidate = true;
                                });
                              }

                              registerThread();
                            },
                            child: Text('Register',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.lightGreen)),
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
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
