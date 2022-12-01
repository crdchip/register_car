import 'package:get/instance_manager.dart';
import 'package:register_driver_car/app/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
