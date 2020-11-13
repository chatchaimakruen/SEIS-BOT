import 'package:flutter/material.dart';

class Footer2 extends StatefulWidget {
  Footer2({Key key}) : super(key: key);

  @override
  _Footer2State createState() => _Footer2State();
}

class _Footer2State extends State<Footer2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
            'ถ้าผู้ใช้ อยากทราบเรื่งอะไรเกี่ยวกับ สาขา เช่น ตารางเรรียน ตารางสอบ วันเปิดเทอม หรือ หลักสูตร. "ให้พิมพ์ถามได้เลยนะครับ"')
      ],
    );
  }
}
