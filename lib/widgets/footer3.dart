import 'package:flutter/material.dart';

class Footer3 extends StatefulWidget {
  Footer3({Key key}) : super(key: key);

  @override
  _Footer3State createState() => _Footer3State();
}

class _Footer3State extends State<Footer3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
            'พิมพ์คำถามให้ตรง ตามความต้องการที่จะค้นหานะครับ เช่น ต้องการค้นหาตารางเรียน ให้พิมพ์คำว่า "ตารางเรียน" ไปลองใช้งาน กันเลย Let.go')
      ],
    );
  }
}
