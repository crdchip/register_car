import 'package:register_driver_car/app/login/model/login_user_token.dart';

class UserModel {
  Client? client;
  Role? role;

  UserModel({this.client, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (role != null) {
      data['role'] = role!.toJson();
    }
    return data;
  }
}
