import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageApi {
  Future<dynamic> getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var image = prefs.getString(AppConstants.IMAGE);
    return image;
  }
}
