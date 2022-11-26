import 'package:get/instance_manager.dart';
import 'package:register_driver_car/app/history_driver_page/controller/history_driver_controller.dart';

class HistoryDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryDriverController>(() => HistoryDriverController());
  }
}
