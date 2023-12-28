import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindgames/level2page.dart';
import 'package:mindgames/level3page.dart';
import 'package:mindgames/level4page.dart';
import 'package:mindgames/level5page.dart';
import 'package:mindgames/level6page.dart';

class Congrats1 extends StatelessWidget {
  final int currentLevel;

  const Congrats1({Key? key, required this.currentLevel}) : super(key: key);

  void navigateToNextLevel(BuildContext context) {
    // Use conditional navigation to prevent null issues
    if (currentLevel == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Level2page()),
      );
    } else {
      if (currentLevel == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Level3page()),
        );
      } else {
        if (currentLevel == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Level4page()),
          );
        } else {
          if (currentLevel == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Level5page()),
            );
          } else {
            if (currentLevel == 5) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Level6page()),
              );
            }
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 365,
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Text(
            'Congratulations!'.tr,
            style: TextStyle(
              fontSize: 30,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'You nailed it!'.tr,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/images/prize.png',
            height: 80,
          ),
          SizedBox(
            height: 25,
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
              // Navigate to the next level or handle accordingly
              navigateToNextLevel(context);
            },
            child: Text(
              'Next'.tr,
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
