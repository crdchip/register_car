import 'package:get/get.dart';
import 'package:register_driver_car/app/register/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
