import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoleApi {
  Future<String> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var role = prefs.getString(AppConstants.ROLE);
    return role.toString();
  }
}
