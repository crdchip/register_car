import 'package:get/get.dart';
import 'package:register_driver_car/app/home/controller/home/home_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
