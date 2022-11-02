import 'package:register_driver_car/app/register/model/user.dart';

class Clients {
  String? clientName;
  String? fax;
  String? address;
  Users? user;

  Clients({
    required this.clientName,
    required this.fax,
    required this.address,
    required this.user,
  });
  Clients.fromJson(Map<String, dynamic> json) {
    clientName = json["clientName"];
    fax = json["fax"];
    address = json["address"];
    user = json["user"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["clientName"] = clientName;
    data["fax"] = fax;
    data["address"] = address;
    data["user"] = user;
    return data;
  }
}
