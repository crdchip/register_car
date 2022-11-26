import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  Future<dynamic> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString(AppConstants.USER);
    return userName;
  }
}
