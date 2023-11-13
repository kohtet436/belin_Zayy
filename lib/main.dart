import 'package:belin_zayy/app/bindings/app_binding.dart';
import 'package:belin_zayy/app/controllers/theme_controller.dart';
import 'package:belin_zayy/app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/helper/di.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: controller.darkTheme,
      title: 'Belin Zayy',
      initialBinding: AppBinding(),
      initialRoute: Routes.wrapperPage,
      theme: controller.lightTheme,
      getPages: Routes.pages,
    );
  }
}
