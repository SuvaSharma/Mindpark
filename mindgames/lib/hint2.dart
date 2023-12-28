import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindgames/Level1page.dart';

class Hint2 extends StatelessWidget {
  const Hint2({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 360,
        height: 345,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
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
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              'Hint'.tr,
              style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Text(
              'Watch out for those stingers! Rumor has it, one of these bees has a stinger with a reputation –its not just for show, its a real pain inducer!'
                  .tr,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
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
              Navigator.pop(context);
            },
            child: Text(
              'Got it!'.tr,
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
