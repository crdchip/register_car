import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenApi {
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(AppConstants.KEY_ACCESS_TOKEN);
    return token;
  }
}
