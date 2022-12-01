class TrackingStatus {
  FormIns? formIns;
  List<Statustracking>? statustracking;

  TrackingStatus({this.formIns, this.statustracking});

  TrackingStatus.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
  ClientInformation? clientInformation;
  Dataform? dataform;

  FormIns({this.clientInformation, this.dataform});

  FormIns.fromJson(Map<String, dynamic> json) {
    clientInformation = json['client_information'] != null
        ? ClientInformation.fromJson(json['client_information'])
        : null;
    dataform =
        json['dataform'] != null ? Dataform.fromJson(json['dataform']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clientInformation != null) {
      data['client_information'] = clientInformation!.toJson();
    }
    if (dataform != null) {
      data['dataform'] = dataform!.toJson();
    }
    return data;
  }
}

class ClientInformation {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? company;

  ClientInformation(
      {this.id, this.name, this.phone, this.email, this.address, this.company});

  ClientInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['company'] = company;
    return data;
  }
}

class Dataform {
  int? id;
  String? carfleedname;
  String? transportname;
  String? licensePlate;
  String? intendTime;
  String? warehouse;
  String? contNumber1;
  String? cont1seal1;
  String? cont1seal2;
  String? cont1seal3;
  String? contNumber2;
  String? cont2seal1;
  String? cont2seal2;
  String? cont2seal3;
  bool? onlySeal;
  bool? lockState;
  bool? status;

  Dataform(
      {this.id,
      this.carfleedname,
      this.transportname,
      this.licensePlate,
      this.intendTime,
      this.warehouse,
      this.contNumber1,
      this.cont1seal1,
      this.cont1seal2,
      this.cont1seal3,
      this.contNumber2,
      this.cont2seal1,
      this.cont2seal2,
      this.cont2seal3,
      this.onlySeal,
      this.lockState,
      this.status});

  Dataform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carfleedname = json['carfleedname'];
    transportname = json['transportname'];
    licensePlate = json['licensePlate'];
    intendTime = json['intendTime'];
    warehouse = json['warehouse'];
    contNumber1 = json['contNumber1'];
    cont1seal1 = json['cont1seal1'];
    cont1seal2 = json['cont1seal2'];
    cont1seal3 = json['cont1seal3'];
    contNumber2 = json['contNumber2'];
    cont2seal1 = json['cont2seal1'];
    cont2seal2 = json['cont2seal2'];
    cont2seal3 = json['cont2seal3'];
    onlySeal = json['onlySeal'];
    lockState = json['lockState'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['carfleedname'] = carfleedname;
    data['transportname'] = transportname;
    data['licensePlate'] = licensePlate;
    data['intendTime'] = intendTime;
    data['warehouse'] = warehouse;
    data['contNumber1'] = contNumber1;
    data['cont1seal1'] = cont1seal1;
    data['cont1seal2'] = cont1seal2;
    data['cont1seal3'] = cont1seal3;
    data['contNumber2'] = contNumber2;
    data['cont2seal1'] = cont2seal1;
    data['cont2seal2'] = cont2seal2;
    data['cont2seal3'] = cont2seal3;
    data['onlySeal'] = onlySeal;
    data['lockState'] = lockState;
    data['status'] = status;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lv'] = lv;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
