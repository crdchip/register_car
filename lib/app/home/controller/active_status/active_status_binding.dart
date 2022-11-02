import 'package:get/get.dart';
import 'package:register_driver_car/app/home/controller/active_status/active_status_controller.dart';

class ActiveStatusBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ActiveStatusController>(() => ActiveStatusController());
  }
}
