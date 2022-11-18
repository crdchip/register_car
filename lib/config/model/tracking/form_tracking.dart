class Trackinglv0 {
  int? id;
  int? formId;
  int? lineId;
  Lines? lines;
  FormIns? formIns;
  List<Statustracking>? statustracking;

  Trackinglv0(
      {this.id,
      this.formId,
      this.lineId,
      this.lines,
      this.formIns,
      this.statustracking});

  Trackinglv0.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    formId = json['formId'];
    lineId = json['lineId'];
    lines = json['lines'] != null ? Lines.fromJson(json['lines']) : null;
    formIns =
        json['formIns'] != null ? FormIns.fromJson(json['formIns']) : null;
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
    data['formId'] = formId;
    data['lineId'] = lineId;
    if (lines != null) {
      data['lines'] = lines!.toJson();
    }
    if (formIns != null) {
      data['formIns'] = formIns!.toJson();
    }
    if (statustracking != null) {
      data['statustracking'] = statustracking!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lines {
  bool? status;
  String? name;
  int? gateId;
  int? id;

  Lines({this.status, this.name, this.gateId, this.id});

  Lines.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    gateId = json['gateId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['name'] = this.name;
    data['gateId'] = this.gateId;
    data['id'] = this.id;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  String? imgdata;
  int? companyId;
  String? companyname;

  ClientInformation(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.imgdata,
      this.companyId,
      this.companyname});

  ClientInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    imgdata = json['imgdata'];
    companyId = json['companyId'];
    companyname = json['companyname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['imgdata'] = imgdata;
    data['companyId'] = companyId;
    data['companyname'] = companyname;
    return data;
  }
}

class Dataform {
  int? id;
  String? carfleedId;
  String? transportId;
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

  Dataform(
      {this.id,
      this.carfleedId,
      this.transportId,
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
      this.lockState});

  Dataform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carfleedId = json['carfleedId'];
    transportId = json['transportId'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['carfleedId'] = this.carfleedId;
    data['transportId'] = this.transportId;
    data['licensePlate'] = this.licensePlate;
    data['intendTime'] = this.intendTime;
    data['warehouse'] = this.warehouse;
    data['contNumber1'] = this.contNumber1;
    data['cont1seal1'] = this.cont1seal1;
    data['cont1seal2'] = this.cont1seal2;
    data['cont1seal3'] = this.cont1seal3;
    data['contNumber2'] = this.contNumber2;
    data['cont2seal1'] = this.cont2seal1;
    data['cont2seal2'] = this.cont2seal2;
    data['cont2seal3'] = this.cont2seal3;
    data['onlySeal'] = this.onlySeal;
    data['lockState'] = this.lockState;
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
