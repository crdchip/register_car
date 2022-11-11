import 'package:register_driver_car/app/home/models/form_post_account.dart';
import 'package:register_driver_car/app/login/model/login_user_token.dart';
// import 'package:register_driver_car/app/login/model/login_user_token.dart';

class Trackinglv0 {
  int? id;
  int? formIn;
  int? lineId;
  String? lines;
  FormIns? formIns;
  List<Statustracking>? statustracking;

  Trackinglv0(
      {this.id,
      this.formIn,
      this.lineId,
      this.lines,
      this.formIns,
      this.statustracking});

  Trackinglv0.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    formIn = json['formIn'];
    lineId = json['lineId'];
    lines = json['lines'];
    formIns =
        json['FormIns'] != null ? FormIns.fromJson(json['FormIns']) : null;
    if (json['statustracking'] != null) {
      statustracking = <Statustracking>[];
      json['statustracking'].forEach((v) {
        statustracking!.add(Statustracking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['formIn'] = formIn;
    data['lineId'] = lineId;
    data['lines'] = lines;
    if (formIns != null) {
      data['FormIns'] = formIns!.toJson();
    }
    if (statustracking != null) {
      data['statustracking'] = statustracking!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FormIns {
  Client? client;
  FormRegisterCar? formRegisterCar;

  FormIns({this.client, this.formRegisterCar});

  FormIns.fromJson(Map<String, dynamic> json) {
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    formRegisterCar = json['formRegisterCar'] != null
        ? FormRegisterCar.fromJson(json['formRegisterCar'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (client != null) {
      data['client_information'] = client!.toJson();
    }
    if (formRegisterCar != null) {
      data['dataform'] = formRegisterCar!.toJson();
    }
    return data;
  }
}

class Statustracking {
  String? lv;
  String? name;
  int? id;

  Statustracking({this.lv, this.name, this.id});

  Statustracking.fromJson(Map<String, dynamic> json) {
    lv = json['lv'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lv'] = lv;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
