import 'package:flutter/material.dart';

class Cause extends StatefulWidget {
  Cause({Key key}) : super(key: key);

  @override
  _CauseState createState() => _CauseState();
}

class _CauseState extends State<Cause> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หลักสูตร'),
        backgroundColor: Colors.blue[100],
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/chatterscreen', (Route<dynamic> route) => false);
                //_logout();
              })
        ],
      ),
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
                SizedBox(height: 20),
                Text('ชั้นปีที่1',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent)),
                SizedBox(height: 20),
                ClipRRect(
                  child: InteractiveViewer(
                    maxScale: 20,
                    child: Image(
                      image: AssetImage('assets/images/ชั้นปีที่1.PNG'),
                      //fit: BoxFit.cover,
                      // height: 100,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('ชั้นปีที่2',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent)),
                SizedBox(height: 20),
                ClipRRect(
                  child: InteractiveViewer(
                    maxScale: 20,
                    child: Image(
                      image: AssetImage('assets/images/ชั้นปีที่2.PNG'),
                      //fit: BoxFit.cover,
                      // height: 100,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('ชั้นปีที่3',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent)),
                SizedBox(height: 20),
                ClipRect(
                  child: InteractiveViewer(
                    maxScale: 20,
                    child: Image(
                      image: AssetImage('assets/images/ชั้นปีที่3.PNG'),
                      //fit: BoxFit.cover,
                      // height: 100,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('ชั้นปีที่4',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent)),
                SizedBox(height: 20),
                ClipRRect(
                  child: InteractiveViewer(
                    maxScale: 20,
                    child: Image(
                      image: AssetImage('assets/images/ชั้นปีที่4.PNG'),
                      //fit: BoxFit.cover,
                      // height: 100,
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
