import 'package:get/get.dart';
import 'package:register_driver_car/app/home/controller/register_car/register_car_controller.dart';

class RegisterCarBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RegisterCarController>(() => RegisterCarController());
  }
}
