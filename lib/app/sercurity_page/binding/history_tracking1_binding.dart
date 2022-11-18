import 'package:get/instance_manager.dart';
import 'package:register_driver_car/app/history_tracking1/controller/history_tracking1_controller.dart';

class HistoryTracking1Bingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryTracking1Controller>(() => HistoryTracking1Controller());
  }
}
