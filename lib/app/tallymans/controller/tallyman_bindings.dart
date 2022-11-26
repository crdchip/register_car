import 'package:get/instance_manager.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';

class TallymanBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TallyManController>(() => TallyManController());
  }
}
