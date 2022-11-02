import 'package:get/instance_manager.dart';
import 'package:register_driver_car/app/dashboard/controller/dashboard_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}
