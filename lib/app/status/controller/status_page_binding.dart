import 'package:get/get.dart';
import 'package:register_driver_car/app/status/controller/status_page_controller.dart';

class StatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusController>(() => StatusController());
  }
}
