import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinators/view/coordinators_page.dart';
import 'package:register_driver_car/app/coordinators/view/coordinators_screen.dart';
import 'package:register_driver_car/app/customers/customer_page.dart';
import 'package:register_driver_car/app/customers/view/details_list_driver.dart';
import 'package:register_driver_car/app/customers/view/list_driver.dart';
import 'package:register_driver_car/app/dashboard/controller/dashboard_binding.dart';
import 'package:register_driver_car/app/dashboard/view/dashboard_page.dart';
import 'package:register_driver_car/app/driver_page/view/driver_page.dart';
import 'package:register_driver_car/app/driver_page/view/driver_screen.dart';
import 'package:register_driver_car/app/history_driver_page/model/history_driver_model.dart';
import 'package:register_driver_car/app/history_driver_page/view/history_form_details_screen.dart';
import 'package:register_driver_car/app/history_driver_page/view/history_form_driver_page.dart';
import 'package:register_driver_car/app/history_list_driver_company/history_list_driver_company_page.dart';
import 'package:register_driver_car/app/history_list_driver_company/view/details_history_list_driver_company_screen.dart';
import 'package:register_driver_car/app/history_list_driver_company/view/history_list_driver_company_screen.dart';
import 'package:register_driver_car/app/history_tracking1/view/history_page.dart';
import 'package:register_driver_car/app/history_tracking1/view/history_sreen.dart';
import 'package:register_driver_car/app/leader_page/view/leader_screen.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_bindings.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/app/sercurity_page/dashboard_security_page.dart';
import 'package:register_driver_car/app/home/controller/register_car/register_car_binding.dart';
import 'package:register_driver_car/app/home/view/home_page.dart';
import 'package:register_driver_car/app/home/view/register_car/register_car_page.dart';
import 'package:register_driver_car/app/home/view/register_car/show_information_register.dart';

import 'package:register_driver_car/app/home/view/webview.dart';
import 'package:register_driver_car/app/login/view/login_screen.dart';
import 'package:register_driver_car/app/register/view/register_page.dart';
import 'package:register_driver_car/app/sercurity_page/view/dashboard_sercurity_screen.dart';
import 'package:register_driver_car/app/sercurity_page/view/details_screen.dart';
import 'package:register_driver_car/app/sercurity_page/view/sercurity_final_details_screen.dart';
import 'package:register_driver_car/app/sercurity_page/view/sercurity_final_screen.dart';

import 'package:register_driver_car/app/splash/controller/splash_binding.dart';
import 'package:register_driver_car/app/splash/view/splash_screen.dart';

import 'package:register_driver_car/app/status/view/status_screen.dart';
import 'package:register_driver_car/app/tallymans/tallyman_page.dart';
import 'package:register_driver_car/app/tallymans/view/tallyman_details_screen.dart';
import 'package:register_driver_car/app/tallymans/view/tallyman_final_screen.dart';
import 'package:register_driver_car/app/tallymans/view/tallyman_woking_screen.dart';
import 'package:register_driver_car/app/tallymans/view/tallyman_working_details_screen.dart';
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
      name: Routes.DASHBOARD_SECURITY_PAGE,
      page: () => DashBoardSecurityPage(),
      binding: SercurityBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.DASHBOARD_SECURITY_SCREEN,
      page: () => DashBoardSercurityScreen(),
      binding: SercurityBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.SERCURITY_FINAL_SCREEN,
      page: () => SercurityFinalScreen(),
      binding: SercurityBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.SERCURITY_FINAL_DETAILS_SCREEN,
      page: () => SercurityFinalDetailsScreen(),
      binding: SercurityBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.DETAILS_SERCURITY,
      page: () => DetailsSercurity(
        dataform: null,
      ),
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
    ),
    GetPage(
      name: Routes.HISTORY_SCREEN,
      page: () => HistorySercurityPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.COORDINATOR_PAGE,
      page: () => CoordinatorsPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.LEADER_SCREEN,
      page: () => LeaderScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_PAGE,
      page: () => DriverPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.HISTORY_DRIVER_PAGE,
      page: () => HistoryFormDriverPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.HISTORY_FORM_DETAILS_SCREEN,
      page: () => HistoryFormDetailsScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.CUSTOMER_PAGE,
      page: () => CustomerPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.LIST_DRIVER_SCREEN,
      page: () => ListDriverScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_SCREEN,
      page: () => DriverScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_LIST_DRIVER_SCREEN,
      page: () => DetailsListDriver(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.HISTORY_LIST_DRIVER_COMPANY_PAGE,
      page: () => HistoryListDriverCompanyPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.HISTORY_LIST_DRIVER_COMPANY_SCREEN,
      page: () => HistoryListDriverCompanyScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.DETAILS_HISTORY_LIST_DRIVER_COMPANY_SCREEN,
      page: () => DetailsHistoryListDriverCompanyScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.TALLYMAN_PAGE,
      page: () => TallymanPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.TALLYMAN_DETAILS_SCREEN,
      page: () => TallyManDetailsScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.TALLYMAN_WORKING_SCREEN,
      page: () => TallymanWorkingScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.TALLYMAN_WORKING_DETAILS_SCREEN,
      page: () => TallymanWorkingDetailsScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.TALLYMAN_FINAL_SCREEN,
      page: () => TallymanFinalScreen(),
      // binding: RegisterCarBinding(),
    )
  ];
}
