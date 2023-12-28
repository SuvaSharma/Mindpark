import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mindgames/controllers/language_controller.dart';
import 'package:mindgames/splash_screen.dart';
import 'package:get/get.dart';
import 'package:mindgames/utils/app_constants.dart';
import 'package:mindgames/utils/app_routes.dart';
import 'package:mindgames/utils/messages.dart';
import 'package:mindgames/utils/dep.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Map<String, Map<String, String>> _languages = await dep.init();

  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  MyApp({required this.languages});
  final Map<String, Map<String, String>> languages;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (LocalizationController) {
      return GetMaterialApp(
        locale: LocalizationController.locale,
        translations: Messages(languages: languages),
        fallbackLocale: Locale(
          AppConstants.languages[0].languageCode,
          AppConstants.languages[0].countryCode,
        ),
        initialRoute: RouteHelper.getSplashRoute(),
        getPages: RouteHelper.routes,
      );
    });
  }
}
// }
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   Map<String, Map<String, String>> _languages = await dep.init();
// }

// class MyApp extends StatelessWidget {
//   MyApp({required this.languages});

//   final Map<String, Map<String, String>> languages;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LocalizationController>(
//       builder: (LocalizationController) {
//         // Determine the current language based on the app's locale
//         String currentLanguageCode = LocalizationController.locale.languageCode;

//         // Get the language map for the current language
//         Map<String, String> currentLanguageMap =
//             languages[currentLanguageCode] ?? {};

//         return GetMaterialApp(
//           locale: LocalizationController.locale,
//           translations: Messages(language: languages),
//           fallbackLocale: Locale(
//             AppConstants.languages[0].languageCode,
//             AppConstants.languages[0].countryCode,
//           ),
//           initialRoute: RouteHelper.getSplashRoute(),
//           getPages: RouteHelper.routes,
//         );
//       },
//     );
//   }
// }
