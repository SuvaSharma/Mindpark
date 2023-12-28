import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mindgames/level1page.dart';
import 'package:mindgames/level2page.dart';
import 'package:mindgames/level3page.dart';
import 'package:mindgames/level4page.dart';
import 'package:mindgames/level5page.dart';
import 'package:mindgames/level6page.dart';
import 'package:mindgames/level8page.dart';
import 'package:mindgames/profile.dart';
import 'package:rive/rive.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 50),
              painter: OvalBottomBorderPainter(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 38),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      elevation: 7,
                      borderRadius: BorderRadius.circular(30),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.settings),
                              iconSize: 35,
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Stack(
                        children: [
                          Material(
                            elevation: 7,
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Positioned(
                            child: IconButton(
                              icon: Icon(Icons.home),
                              iconSize: 35,
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      elevation: 7,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.person),
                          iconSize: 35,
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 12, left: 120),
            child: Text(
              'Take a test!',
              style: TextStyle(
                  fontFamily: "PermanentMarker",
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
              child: Column(
                children: [
                  // First Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to the new page (Level1)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Level1page()),
                          );
                        },
                        child: Container(
                          width: 160,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Text(
                                  '1'.tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                left: 2,
                                child: Image.asset(
                                  'assets/images/lock.png',
                                  width: 80,
                                  height: 80, // Adjust the height as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the new page (Level1)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Level2page()),
                          );
                        },
                        child: Container(
                          width: 160,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Text(
                                  '2'.tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                left: 2,
                                child: Image.asset(
                                  'assets/images/lock.png',
                                  width: 80,
                                  height: 80, // Adjust the height as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to the new page (Level1)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Level3page()),
                          );
                        },
                        child: Container(
                          width: 160,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Text(
                                  '3'.tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                left: 2,
                                child: Image.asset(
                                  'assets/images/lock.png',
                                  width: 80,
                                  height: 80, // Adjust the height as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the new page (Level1)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Level4page()),
                          );
                        },
                        child: Container(
                          width: 160,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Text(
                                  '4'.tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                left: 2,
                                child: Image.asset(
                                  'assets/images/lock.png',
                                  width: 80,
                                  height: 80, // Adjust the height as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to the new page (Level1)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Level5page()),
                          );
                        },
                        child: Container(
                          width: 160,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Text(
                                  '5'.tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                left: 2,
                                child: Image.asset(
                                  'assets/images/lock.png',
                                  width: 80,
                                  height: 80, // Adjust the height as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the new page (Level1)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Level6page()),
                          );
                        },
                        child: Container(
                          width: 160,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Text(
                                  '6'.tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                left: 2,
                                child: Image.asset(
                                  'assets/images/lock.png',
                                  width: 80,
                                  height: 80, // Adjust the height as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Level8page()));
                        },
                        child: Container(
                          width: 160,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Text(
                                  '7'.tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                left: 2,
                                child: Image.asset(
                                  'assets/images/lock.png',
                                  width: 80,
                                  height: 80, // Adjust the height as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Level8page()));
                        },
                        child: Container(
                          width: 160,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Text(
                                  '8'.tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                left: 2,
                                child: Image.asset(
                                  'assets/images/lock.png',
                                  width: 80,
                                  height: 80, // Adjust the height as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class OvalBottomBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5;
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(
        size.width,
        size.height - 50,
      )
      ..quadraticBezierTo(
        size.width / 2,
        size.height - 120,
        0,
        size.height - 50,
      )
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
