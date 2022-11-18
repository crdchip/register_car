import 'package:get/instance_manager.dart';

class HistoryTracking1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryTracking1Binding());
  }
}
