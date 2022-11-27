import 'package:get/get.dart';
import 'package:register_driver_car/app/leader_page/controller/leader_controller.dart';

class LeaderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderController>(() => LeaderController());
  }
}
