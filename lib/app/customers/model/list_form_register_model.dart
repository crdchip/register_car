class ListFormRegisterModel {
  ClientInformation? clientInformation;
  Dataform? dataform;

  ListFormRegisterModel({this.clientInformation, this.dataform});

  ListFormRegisterModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? imgpath;
  bool? status;
  int? userId;
  String? address;
  String? name;
  String? phone;
  String? imgname;
  int? companyId;

  ClientInformation({
    this.id,
    this.email,
    this.imgpath,
    this.status,
    this.userId,
    this.address,
    this.name,
    this.phone,
    this.imgname,
    this.companyId,
  });

  ClientInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    imgpath = json['imgpath'];
    status = json['status'];
    userId = json['UserId'];
    address = json['address'];
    name = json['name'];
    phone = json['phone'];
    imgname = json['imgname'];
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['imgpath'] = imgpath;
    data['status'] = status;
    data['UserId'] = userId;
    data['address'] = address;
    data['name'] = name;
    data['phone'] = phone;
    data['imgname'] = imgname;
    data['companyId'] = companyId;
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
  String? timein;
  String? timeout;

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
      this.status,
      this.timein,
      this.timeout});

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
    timein = json['timein'];
    timeout = json['timeout'];
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
    data['timein'] = timein;
    data['timeout'] = timeout;
    return data;
  }
}
