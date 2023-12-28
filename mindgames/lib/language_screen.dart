import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindgames/Levels_screen.dart';
import 'package:mindgames/controllers/language_controller.dart';
import 'package:mindgames/language_widget.dart';
import 'package:mindgames/level1page.dart';
import 'package:mindgames/models/language_model.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<LocalizationController>(
          builder: (localizationController) {
            // Pre-translate texts
            String selectLanguageText = 'select_language'.tr;
            String youCanChangeLanguageText = 'you_can_change_language'.tr;
            String playText = 'Play'.tr;

            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/mindparklogo.png",
                      width: 350,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      selectLanguageText,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.08,
                    ),
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: LanguageWidget(
                        languageModel: localizationController.languages[index],
                        localizationController: localizationController,
                        index: index,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    youCanChangeLanguageText,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 150,
                    child: MaterialButton(
                      elevation: 5,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.black, width: 2)),
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return LevelPage();
                          }),
                        );
                      },
                      child: Text(
                        playText,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]);
          },
        ),
      ),
    );
  }
}
