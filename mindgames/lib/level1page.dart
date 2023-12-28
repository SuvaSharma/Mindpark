import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindgames/congrats1.dart';
import 'package:mindgames/hint1.dart';
import 'package:mindgames/Levels_screen.dart';
import 'package:mindgames/level2page.dart';
import 'package:mindgames/wrong.dart';

class Level1page extends StatelessWidget {
  const Level1page({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFF4F9FF),
      body: SingleChildScrollView(
        child: Column(
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
                      'No. 1'.tr,
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
                'How many triangles are there in this picture?'.tr,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/Level1.png',
              width: 260,
              height: 320,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              height: 50,
              child: Material(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Answer...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              elevation: 5,
              height: 50,
              minWidth: 150,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: Colors.black, width: 3),
              ),
              color: Colors.orange,
              onPressed: () {
                String? inputText = textController.text?.trim();

                if (inputText != null && inputText == '25') {
                  showCongratsDialog(context, currentLevel: 1);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => const WrongAns(),
                  );
                }
              },
              child: Text(
                'ok'.tr,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
                          builder: (context) => const Hint1(),
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
                            return Level2page();
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void showCongratsDialog(BuildContext context, {required int currentLevel}) {
//   showDialog(
//     context: context,
//     builder: (context) => Congrats1(currentLevel: currentLevel),
//   );
// }
