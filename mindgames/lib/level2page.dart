import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindgames/Levels_screen.dart';
import 'package:mindgames/congrats1.dart';
import 'package:mindgames/hint1.dart';
import 'package:mindgames/hint2.dart';
import 'package:mindgames/level3page.dart';
import 'package:mindgames/wrong.dart';

class Level2page extends StatelessWidget {
  const Level2page({Key? key});

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
                    'No. 2'.tr,
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
              'Which one is not the identical honey bee?'.tr,
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
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const WrongAns(),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Image.asset(
                          'assets/images/wrongbee.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const WrongAns(),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Image.asset(
                          'assets/images/wrongbee.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const WrongAns(),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Image.asset(
                          'assets/images/wrongbee.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Congrats1(currentLevel: 2),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Image.asset(
                          'assets/images/rightbee.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const WrongAns(),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Image.asset(
                          'assets/images/wrongbee.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const WrongAns(),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Image.asset(
                          'assets/images/wrongbee.png',
                          fit: BoxFit.cover,
                        ),
                      ),
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
                          return Level3page();
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
}

void showCongratsDialog(BuildContext context, {required int currentLevel}) {
  showDialog(
    context: context,
    builder: (context) => Congrats1(currentLevel: currentLevel),
  );
}
