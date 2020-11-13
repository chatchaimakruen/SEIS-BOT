import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Branch extends StatefulWidget {
  Branch({Key key}) : super(key: key);

  @override
  _BranchState createState() => _BranchState();
}

class _BranchState extends State<Branch> {
  String myvideo = 'assets/video/branch.mp4';
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.asset(myvideo);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('วีดีโอเเนะนำสาขา'),
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
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
    );
  }
}
