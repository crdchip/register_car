class ListFormCompany {
  ClientInformation? clientInformation;
  Dataform? dataform;

  ListFormCompany({this.clientInformation, this.dataform});

  ListFormCompany.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? phone;
  String? address;
  String? imgname;
  int? companyId;
  String? email;
  int? id;
  String? imgpath;
  bool? status;
  int? userId;

  ClientInformation(
      {this.name,
      this.phone,
      this.address,
      this.imgname,
      this.companyId,
      this.email,
      this.id,
      this.imgpath,
      this.status,
      this.userId});

  ClientInformation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    imgname = json['imgname'];
    companyId = json['companyId'];
    email = json['email'];
    id = json['id'];
    imgpath = json['imgpath'];
    status = json['status'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['imgname'] = imgname;
    data['companyId'] = companyId;
    data['email'] = email;
    data['id'] = id;
    data['imgpath'] = imgpath;
    data['status'] = status;
    data['UserId'] = userId;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
