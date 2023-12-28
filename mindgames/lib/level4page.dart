import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindgames/Levels_screen.dart';
import 'package:mindgames/congrats1.dart';
import 'package:mindgames/hint2.dart';
import 'package:mindgames/level5page.dart';
import 'package:mindgames/wrong.dart';

class Level4page extends StatefulWidget {
  const Level4page({Key? key}) : super(key: key);

  @override
  _Level4pageState createState() => _Level4pageState();
}

class _Level4pageState extends State<Level4page> {
  bool isFourthImagePressed = false;
  bool isSixthImagePressed = false;

  void checkImagesPressed() {
    if (isFourthImagePressed && isSixthImagePressed) {
      // Show Congratulations dialogue for both images
      showDialog(
        context: context,
        builder: (context) => Congrats1(currentLevel: 4),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F9FF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.home_filled),
                  iconSize: 50,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LevelPage();
                      }),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 90,
                  ),
                  child: Text(
                    'No. 4'.tr,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Find Two of a kind!'.tr,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildImageContainer(
                      'assets/images/normalchief.png',
                      0,
                      isPressed: false,
                    ),
                    _buildImageContainer(
                      'assets/images/normalchief.png',
                      1,
                      isPressed: false,
                    ),
                    _buildImageContainer(
                      'assets/images/normalchief.png',
                      2,
                      isPressed: false,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildImageContainer(
                      'assets/images/bottonchief.png',
                      3,
                      isPressed: isFourthImagePressed,
                    ),
                    _buildImageContainer(
                      'assets/images/normalchief.png',
                      4,
                      isPressed: false,
                    ),
                    _buildImageContainer(
                      'assets/images/unshinychief.png',
                      5,
                      isPressed: isSixthImagePressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 50,
              left: 50,
            ),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.refresh),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const Hint2(),
                      );
                    },
                    child: Image.asset(
                      'assets/images/hint.png',
                      height: 80,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_forward),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Level5page();
                        }),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageContainer(String imagePath, int index,
      {required bool isPressed}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == 3) {
            isFourthImagePressed = !isFourthImagePressed;
          } else if (index == 5) {
            isSixthImagePressed = !isSixthImagePressed;
          }
          checkImagesPressed();
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3 - 20,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          if (isPressed)
            Icon(
              Icons.check_rounded,
              color: Colors.green,
              size: 80,
            ),
        ],
      ),
    );
  }
}

void showCongratsDialog(BuildContext context, {required int currentLevel}) {
  showDialog(
    context: context,
    builder: (context) => Congrats1(currentLevel: currentLevel),
  );
}
