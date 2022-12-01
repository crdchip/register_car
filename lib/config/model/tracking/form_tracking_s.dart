class Tracking {
  int? id;
  int? formId;
  int? lineId;
  Lines? lines;
  FormIns? formIns;
  List<Statustracking>? statustracking;

  Tracking(
      {this.id,
      this.formId,
      this.lineId,
      this.lines,
      this.formIns,
      this.statustracking});

  Tracking.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
  int? id;
  int? gateId;
  Gate? gate;

  Lines({this.status, this.name, this.id, this.gateId, this.gate});

  Lines.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    id = json['id'];
    gateId = json['gateId'];
    gate = json['gate'] != null ? Gate.fromJson(json['gate']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['name'] = name;
    data['id'] = id;
    data['gateId'] = gateId;
    if (gate != null) {
      data['gate'] = gate!.toJson();
    }
    return data;
  }
}

class Gate {
  int? id;
  bool? status;
  String? name;
  String? local;
  String? warehouseId;
  Warehouse? warehouse;

  Gate(
      {this.id,
      this.status,
      this.name,
      this.local,
      this.warehouseId,
      this.warehouse});

  Gate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    local = json['local'];
    warehouseId = json['warehouseId'];
    warehouse = json['warehouse'] != null
        ? Warehouse.fromJson(json['warehouse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['name'] = name;
    data['local'] = local;
    data['warehouseId'] = warehouseId;
    if (warehouse != null) {
      data['warehouse'] = warehouse!.toJson();
    }
    return data;
  }
}

class Warehouse {
  String? id;
  String? name;

  Warehouse({this.id, this.name});

  Warehouse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
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
  int? companyid;
  String? imgdata;
  String? companyname;

  ClientInformation(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.companyid,
      this.imgdata,
      this.companyname});

  ClientInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    companyid = json['companyid'];
    imgdata = json['imgdata'];
    companyname = json['companyname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['companyid'] = companyid;
    data['imgdata'] = imgdata;
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
  bool? status;

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
      this.lockState,
      this.status});

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
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['carfleedId'] = carfleedId;
    data['transportId'] = transportId;
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
  String? name;
  int? id;
  String? lv;

  Statustracking({this.name, this.id, this.lv});

  Statustracking.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    lv = json['lv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['lv'] = lv;
    return data;
  }
}
