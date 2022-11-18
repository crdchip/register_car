import 'package:get/instance_manager.dart';
import 'package:register_driver_car/app/coordinators/controller/coordinator_controller.dart';

class CoordinatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoordinatorController>(() => CoordinatorController());
  }
}
