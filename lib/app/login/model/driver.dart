import 'package:register_driver_car/app/login/model/user.dart';

class Drivers {
  String? firstName;
  String? lastName;
  String? cccd;
  String? gplx;
  String? phone;
  Users? user;

  Drivers({
    required this.firstName,
    required this.lastName,
    required this.cccd,
    required this.gplx,
    required this.phone,
    required this.user,
  });
  Drivers.fromJson(Map<String, dynamic> json) {
    firstName = json["firstName"];
    lastName = json["lastName"];
    cccd = json["cccd"];
    gplx = json["gplx"];
    phone = json["phone"];
    user = json["user"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["cccd"] = cccd;
    data["gplx"] = gplx;
    data["phone"] = phone;
    data["user"] = user;
    return data;
  }
}
