import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  static const LatLng centerMap = const LatLng(13.747407, 100.525790);
  CameraPosition cameraPosition = CameraPosition(
    target: centerMap,
    zoom: 16.0,
  );

  Widget myMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController googleMapController) {},
      markers: pitMarker(),
    );
  }

  Set<Marker> pitMarker() {
    return <Marker>[
      Marker(position: centerMap, markerId: MarkerId('idPIT')),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สาขาวิศวกรรมซอฟแวร์'),
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/pathumwan.jpg'),
                fit: BoxFit.cover,
                height: 200,
                width: 1000,
              ),
              SizedBox(height: 20),
              Text('สาขาวิศวกรรมซอฟแวร์เเละระบบสารสนเทศ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent)),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('ที่อยู่ 833 ถ. พระรามที่ 1 วังใหม่ปทุมวัน',
                      style: TextStyle(fontSize: 20, color: Colors.lightGreen)),
                  Text('กรุงเทพมหานคร 10330',
                      style: TextStyle(fontSize: 20, color: Colors.lightGreen)),
                  SizedBox(height: 10),
                  Text('TEL : +66 2104 9099 ext.5000',
                      style: TextStyle(fontSize: 20, color: Colors.lightGreen)),
                ],
              ),
              SizedBox(height: 15.0),
              showmap()
            ],
          ),
        ),
      ),
    );
  }

  Container showmap() {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
      color: Colors.grey,
      height: 350,
      child: myMap(),
    );
  }
}
