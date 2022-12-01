import 'package:get/instance_manager.dart';
import 'package:register_driver_car/app/admin/controller/admin_controller.dart';

class AdminBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(() => AdminController());
  }
}
