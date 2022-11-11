import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:register_driver_car/app/splash/controller/splash_binding.dart';
import 'package:register_driver_car/app/splash/view/splash_screen.dart';
import 'package:register_driver_car/config/core/theme/theme_provider.dart';
import 'package:register_driver_car/config/routes/pages.dart';

import 'config/core/constants/constants.dart';

void main() async {
  await GetStorage.init('MyStorage');
  final box = GetStorage('MyStorage');
  String? mode = box.read(AppConstants.THEME_KEY);
  bool isLightMode = (mode != null && mode == "light");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      home: SplashPage(),
    ),
  );
}
