import 'package:get/get.dart';
import 'package:register_driver_car/app/history_list_driver_company/controller/history_list_driver_company_controller.dart';

class HistoryListDriverCompanyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryListDriverCompanyController>(
        () => HistoryListDriverCompanyController());
  }
}
