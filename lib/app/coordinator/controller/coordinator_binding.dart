import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinator/controller/coordinator_controller.dart';

class CoordinatorBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoordinatorController>(() => CoordinatorController());
  }
}
