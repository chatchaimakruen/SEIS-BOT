import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  Footer({Key key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('เเนะนำวิธีการใช้งาน'),
        Text("บอทยิ้มเป็นแอทมินนะครับ "),
        Text('จะให้ข้อมูลเกี่ยวกับ'),
        Text('สาขาวิศวกรรมซอฟแวร์เเละเทคโนโลยีสารสนเทศเท่านั้น นะครับ')
      ],
    );
  }
}
