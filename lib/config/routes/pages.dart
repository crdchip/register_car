import 'package:get/get.dart';
import 'package:register_driver_car/app/admin/admin_page.dart';
import 'package:register_driver_car/app/admin/view/coordinator/admin_coordinator_details_screen.dart';
import 'package:register_driver_car/app/admin/view/coordinator/admin_status_lines_details_screen.dart';
import 'package:register_driver_car/app/admin/view/coordinator/admin_status_lines_screen.dart';
import 'package:register_driver_car/app/admin/view/coordinator/admin_warehouse_details_screen.dart';
import 'package:register_driver_car/app/admin/view/sercurity/admin_sercurity_final_details_screen.dart';
import 'package:register_driver_car/app/admin/view/tallyman/view/admin_tallyman_details_screen.dart';
import 'package:register_driver_car/app/admin/view/tallyman/view/admin_tallyman_working_details_screen.dart';

import 'package:register_driver_car/app/coordinator/coordinator_page.dart';
import 'package:register_driver_car/app/coordinator/view/coordinator_details_screen.dart';
import 'package:register_driver_car/app/coordinator/view/status_lines_details_screen.dart';
import 'package:register_driver_car/app/coordinator/view/status_lines_screen.dart';
import 'package:register_driver_car/app/coordinator/view/warehouse_details_screen.dart';
import 'package:register_driver_car/app/coordinator/view/warehouse_screen.dart';

import 'package:register_driver_car/app/customers/customer_page.dart';
import 'package:register_driver_car/app/customers/view/create_form_screen.dart';
import 'package:register_driver_car/app/customers/view/details_form_register_screen.dart';
import 'package:register_driver_car/app/customers/view/details_list_driver.dart';
import 'package:register_driver_car/app/customers/view/list_driver.dart';
import 'package:register_driver_car/app/driver_page/view/driver_detail_page.dart';
import 'package:register_driver_car/app/driver_page/driver_page.dart';
import 'package:register_driver_car/app/driver_page/view/driver_screen.dart';
import 'package:register_driver_car/app/driver_page/view/list_form_driver_details_screem.dart';
import 'package:register_driver_car/app/driver_page/view/list_form_driver_screen.dart';
import 'package:register_driver_car/app/history_driver_page/view/history_form_details_screen.dart';
import 'package:register_driver_car/app/history_driver_page/view/history_form_driver_page.dart';
import 'package:register_driver_car/app/history_list_driver_company/history_list_driver_company_page.dart';
import 'package:register_driver_car/app/history_list_driver_company/view/details_history_list_driver_company_screen.dart';
import 'package:register_driver_car/app/history_list_driver_company/view/history_list_driver_company_screen.dart';
import 'package:register_driver_car/app/leader_page/view/leader_screen.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_bindings.dart';
import 'package:register_driver_car/app/sercurity_page/dashboard_security_page.dart';
import 'package:register_driver_car/app/login/view/login_screen.dart';

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
    //ADMIN
    GetPage(
      name: Routes.ADMIN_PAGE,
      page: () => const AdminPage(),
      // binding: AdminBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.ADMIN_SERCURITY_FINAL_DETAILS_SCREEN,
      page: () => const AdminSercurityFinalDetailsScreen(),
      // binding: AdminBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.ADMIN_WAREHOUSE_DETAILS_SCREEM,
      page: () => const AdminWareHouseDetailsScreen(),
      // binding: AdminBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.ADMIN_STATUS_LINES_SCREEN,
      page: () => const AdminStatusLinesScreen(),
      // binding: AdminBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.ADMIN_STATUS_LINES_DETAILS_SCREEN,
      page: () => const AdminStatusLinesDetailsScreen(),
      // binding: AdminBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.ADMIN_COORDINATOR_DETAILS_SCREEN,
      page: () => const AdminCoordinatorDetailsScreen(),
      // binding: AdminBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.ADMIN_TALLYMAN_DETAILS_SCREEN,
      page: () => const AdminTallyManDetailsScreen(),
      // binding: AdminBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.ADMIN_TALLYMAN_WORKING_DETAILS_SCREEN,
      page: () => const AdminTallymanWorkingDetailsScreen(),
      // binding: AdminBindings(),
      preventDuplicates: false,
    ),

    //spLASH
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      preventDuplicates: false,
    ),

    GetPage(
      name: Routes.DASHBOARD_SECURITY_PAGE,
      page: () => const DashBoardSecurityPage(),
      binding: SercurityBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.DASHBOARD_SECURITY_SCREEN,
      page: () => const DashBoardSercurityScreen(),
      binding: SercurityBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.SERCURITY_FINAL_SCREEN,
      page: () => const SercurityFinalScreen(),
      binding: SercurityBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.SERCURITY_FINAL_DETAILS_SCREEN,
      page: () => const SercurityFinalDetailsScreen(),
      binding: SercurityBindings(),
      preventDuplicates: false,
    ),
    GetPage(
      name: Routes.DETAILS_SERCURITY,
      page: () => const DetailsSercurity(
        dataform: null,
      ),
      binding: SercurityBindings(),
      preventDuplicates: false,
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: SplashBinding(),
      preventDuplicates: false,
    ),

    // GetPage(
    //   name: Routes.INFOR_DRIVER,
    //   page: () => const ShowInformationPage(),
    //   // binding: RegisterCarBinding(),
    // ),
    GetPage(
      name: Routes.STATUS_SCREEN,
      page: () => const StatusScreen(),
      // binding: RegisterCarBinding(),
    ),

    //Coordinator_page

    GetPage(
      name: Routes.COORDINATOR_PAGE,
      page: () => const CoordinatorPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.COORDINATOR_DETAILS_SCREEN,
      page: () => const CoordinatorDetailsScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.STATUS_LINES_SCREEN,
      page: () => const StatusLinesScreen(),
    ),
    GetPage(
      name: Routes.STATUS_LINES_DETAILS_SCREEN,
      page: () => const StatusLinesDetailsScreen(),
    ),
    GetPage(
      name: Routes.WAREHOUSE_SCREEN,
      page: () => const WareHouseScreen(),
    ),
    GetPage(
      name: Routes.WAREHOUSE_DETAILS_SCREEN,
      page: () => const WareHouseDetailsScreen(),
    ),
    //Leader
    GetPage(
      name: Routes.LEADER_SCREEN,
      page: () => const LeaderScreen(),
      // binding: RegisterCarBinding(),
    ),
    //DRIVER
    GetPage(
      name: Routes.DRIVER_PAGE,
      page: () => const DriverPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_DETAILS_PAGE,
      page: () => const DriverDetailsPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.LIST_FORM_DRIVER_SCREEN,
      page: () => const ListFormDriverScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.LIST_FORM_DRIVER_DETAILS_SCREEN,
      page: () => const ListFormDriverDetailsScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.HISTORY_DRIVER_PAGE,
      page: () => const HistoryFormDriverPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.HISTORY_FORM_DETAILS_SCREEN,
      page: () => const HistoryFormDetailsScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.CUSTOMER_PAGE,
      page: () => const CustomerPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.LIST_DRIVER_SCREEN,
      page: () => const ListDriverScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_SCREEN,
      page: () => const DriverScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_LIST_DRIVER_SCREEN,
      page: () => const DetailsListDriver(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.HISTORY_LIST_DRIVER_COMPANY_PAGE,
      page: () => const HistoryListDriverCompanyPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.HISTORY_LIST_DRIVER_COMPANY_SCREEN,
      page: () => const HistoryListDriverCompanyScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.DETAILS_HISTORY_LIST_DRIVER_COMPANY_SCREEN,
      page: () => const DetailsHistoryListDriverCompanyScreen(),
      // binding: RegisterCarBinding(),
    ),
    //CÚSTOMER
    GetPage(
      name: Routes.FORM_REGISTER_IN_CUSTOMER_SCREEN,
      page: () => const FormRegisterInCustomerScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.DETAILS_FORM_REGISTER_SCREEN,
      page: () => const DetailsFormRegisterScreen(),
      // binding: RegisterCarBinding(),
    ),
    //TALLYMAN
    GetPage(
      name: Routes.TALLYMAN_PAGE,
      page: () => const TallymanPage(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.TALLYMAN_DETAILS_SCREEN,
      page: () => const TallyManDetailsScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.TALLYMAN_WORKING_SCREEN,
      page: () => const TallymanWorkingScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.TALLYMAN_WORKING_DETAILS_SCREEN,
      page: () => const TallymanWorkingDetailsScreen(),
      // binding: RegisterCarBinding(),
    ),
    GetPage(
      name: Routes.TALLYMAN_FINAL_SCREEN,
      page: () => const TallymanFinalScreen(),
      // binding: RegisterCarBinding(),
    )
  ];
}
