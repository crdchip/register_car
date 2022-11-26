import 'package:get/get.dart';
import 'package:register_driver_car/app/customers/controller/customer_controller.dart';

class CustomerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(() => CustomerController());
  }
}
