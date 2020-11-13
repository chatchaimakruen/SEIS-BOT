import 'package:botyim/model/Detail.dart';
import 'package:flutter/material.dart';

final imagesList = [
  'assets/images/read1.gif',
  'assets/images/read2.gif',
  'assets/images/read3.gif',
];

final colorList = [
  Colors.redAccent.shade100,
  Colors.blueAccent.shade100,
  Colors.amber.shade50
];

class Slide extends StatefulWidget {
  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  int currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: colorList[currentPage],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 400.0,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return itemBuilder(index);
                  },
                  controller: _pageController,
                  pageSnapping: true,
                  onPageChanged: _onPageChanged,
                  itemCount: 3,
                  physics: ClampingScrollPhysics(),
                ),
              ),
              _detailsBuilder(currentPage),
            ],
          )
        ],
      ),
    );
  }

  Widget _detailsBuilder(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
        }

        return Expanded(
          child: Transform.translate(
            offset: Offset(0, 100 + (-value * 100)),
            child: Opacity(
              opacity: value,
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      detailsList[index].title,
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      detailsList[index].description,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 5.0,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    // Text(
                    //   "Read More",
                    //   style: TextStyle(
                    //       fontSize: 18.0, fontWeight: FontWeight.w900),
                    // ),
                    Expanded(
                        child: MaterialButton(
                            child: Text('คุยกับบอท',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    decoration: TextDecoration.underline)),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/botyim',
                              );
                            })),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget itemBuilder(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
          return Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin:
                    const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 10.0),
                height: Curves.easeIn.transform(value) * 600,
                child: child,
              ));
        } else {
          return Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                height:
                    Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                        600,
                child: child,
              ));
        }
      },
      child: Material(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              imagesList[index],
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      print(index);
      currentPage = index;
    });
  }
}
