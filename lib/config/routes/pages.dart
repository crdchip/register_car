import 'package:get/get.dart';
import 'package:register_driver_car/app/dashboard/controller/dashboard_binding.dart';
import 'package:register_driver_car/app/dashboard/view/dashboard_page.dart';
import 'package:register_driver_car/app/home/controller/register_car/register_car_binding.dart';
import 'package:register_driver_car/app/home/view/home_page.dart';
import 'package:register_driver_car/app/home/view/register_car/register_car_page.dart';
import 'package:register_driver_car/app/home/view/register_car/show_information_register.dart';

import 'package:register_driver_car/app/home/view/webview.dart';
import 'package:register_driver_car/app/login/view/login_screen.dart';
import 'package:register_driver_car/app/register/view/register_page.dart';

import 'package:register_driver_car/app/splash/controller/splash_binding.dart';
import 'package:register_driver_car/app/splash/view/splash_screen.dart';

import 'package:register_driver_car/app/status/view/status_screen.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashBoardPage(),
      binding: DashBoardBinding(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: SplashBinding(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: SplashBinding(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: SplashBinding(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.REGISTER_CAR,
      page: () => const RegisterCarPage(),
      binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.INFOR_DRIVER,
      page: () => const ShowInformationPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.STATUS_SCREEN,
      page: () => const StatusScreen(),
      // binding: RegisterCarBinding(),
    ),
    // GetPage(
    //   name: Routes.STATUS_SCREEN_DETAIL,
    //   page: () => StatusDetailScreen(),
    //   // binding: RegisterCarBinding(),
    // ),
    GetPage(
      name: Routes.WEBVIEW_SCREEN,
      page: () => WebViewScreen(),
      // binding: RegisterCarBinding(),
    )
  ];
}
