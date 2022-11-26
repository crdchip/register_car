import 'package:get/instance_manager.dart';
import 'package:register_driver_car/app/driver_page/controller/driver_controller.dart';

class DriverBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverController>(() => DriverController());
  }
}
