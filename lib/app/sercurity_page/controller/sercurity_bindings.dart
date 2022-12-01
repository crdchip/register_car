import 'package:get/instance_manager.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';

class SercurityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SercurityController>(() => SercurityController());
  }
}
