import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        body: Padding(
//       padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            padding: const EdgeInsets.all(0),
            child: Page()))));

class Page extends StatefulWidget {
  @override
  PageState createState() => PageState();
}

class PageState extends State<Page> {
  double left = 0;
  double top = 0;
  late double startHori;
  late double startVert;
  double containerWidth = 100;
  double containerHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
          left: left,
          top: top,
          child: GestureDetector(
              /*
           onHorizontalDragStart: (details) {
             print(details.globalPosition.dx);
             print(details.localPosition.dx);
          
             setState(() {
               startHori = details.localPosition.dx;
             });
           },
           onHorizontalDragUpdate: (details) {
             print('${details.globalPosition.dx}:${details.localPosition.dx}'); 
             var leftVal = details.globalPosition.dx - startHori;
            
             print(leftVal.floor());
            
             if (leftVal < 0) return;
            
             setState(() {
               left = leftVal.floor();
             });
           },
           onVerticalDragStart: (details) {
             setState(() {
               startVert = details.localPosition.dy;
             });
           },
           onVerticalDragUpdate: (details) {
             var topVal = details.globalPosition.dy - startVert;
            
             if (topVal < 0) return;
            
             setState(() {
               top = topVal.floor();
             });
           },
           */
              onPanStart: (details) {
                setState(() {
                  startHori = details.localPosition.dx;
                  startVert = details.localPosition.dy;
                });
              },
              onPanUpdate: (details) {
                var screenWidth = MediaQuery.of(context).size.width;
                var screenHeight = MediaQuery.of(context).size.height;

                var topVal = details.globalPosition.dy - startVert;
                var leftVal = details.globalPosition.dx - startHori;

                var leftBounds = screenWidth - containerWidth;
                var topBounds = screenHeight - containerHeight;

                setState(() {
                  if (leftVal.floor() >= 0 && leftVal <= leftBounds) {
                    left = leftVal.floorToDouble();
                  }

                  if (leftVal < 0) {
                    left = 0;
                  }

                  if (leftVal > leftBounds) {
                    left = leftBounds.floorToDouble();
                  }

                  if (topVal.floor() >= 0 && topVal <= topBounds) {
                    top = topVal.floorToDouble();
                  }

                  if (topVal < 0) {
                    top = 0;
                  }

                  if (topVal > topBounds) {
                    top = topBounds;
                  }
                });
              },
              child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  color: Colors.green,
                  child: const Text(
                      'Click and drag the square around the screen'))))
    ]);
  }
}
