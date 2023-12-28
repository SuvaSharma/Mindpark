import 'package:flutter/material.dart';
import 'package:mindgames/controllers/language_controller.dart';
import 'package:mindgames/models/language_model.dart';
import 'package:mindgames/utils/app_constants.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;

  LanguageWidget({
    required this.languageModel,
    required this.localizationController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 40,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: InkWell(
            onTap: () {
              localizationController.setLanguage(Locale(
                AppConstants.languages[index].languageCode,
                AppConstants.languages[index].countryCode,
              ));
              localizationController.setSelectIndex(index);
            },
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        languageModel.languageName,
                        style: TextStyle(
                          fontSize: 20, // Set your desired text size here
                          // You can also set other text styles like fontWeight, color, etc.
                        ),
                      ),
                    ],
                  ),
                ),
                if (localizationController.selectedIndex == index)
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 40,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.blue[900],
                      size: 30,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
