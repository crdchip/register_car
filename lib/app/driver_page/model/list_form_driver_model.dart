class ListFormDriverModel {
  FormIn? formIn;
  Company? company;
  WareHouse? wareHouse;
  CarFleed? carFleed;
  Transport? transport;

  ListFormDriverModel(
      {this.formIn,
      this.company,
      this.wareHouse,
      this.carFleed,
      this.transport});

  ListFormDriverModel.fromJson(Map<String, dynamic> json) {
    formIn = json['FormIn'] != null ? FormIn.fromJson(json['FormIn']) : null;
    company =
        json['Company'] != null ? Company.fromJson(json['Company']) : null;
    wareHouse = json['WareHouse'] != null
        ? WareHouse.fromJson(json['WareHouse'])
        : null;
    carFleed =
        json['CarFleed'] != null ? CarFleed.fromJson(json['CarFleed']) : null;
    transport = json['Transport'] != null
        ? Transport.fromJson(json['Transport'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (formIn != null) {
      data['FormIn'] = formIn!.toJson();
    }
    if (company != null) {
      data['Company'] = company!.toJson();
    }
    if (wareHouse != null) {
      data['WareHouse'] = wareHouse!.toJson();
    }
    if (carFleed != null) {
      data['CarFleed'] = carFleed!.toJson();
    }
    if (transport != null) {
      data['Transport'] = transport!.toJson();
    }
    return data;
  }
}

class FormIn {
  String? warehouse;
  String? cont2seal3;
  bool? status;
  int? clientInformation;
  String? contNumber1;
  int? id;
  String? cont1seal1;
  bool? onlySeal;
  int? companyId;
  String? cont1seal2;
  bool? lockState;
  String? carfleedId;
  String? cont1seal3;
  String? timein;
  String? transportId;
  String? contNumber2;
  String? timeout;
  String? licensePlate;
  String? cont2seal1;
  String? intendTime;
  String? cont2seal2;

  FormIn(
      {this.warehouse,
      this.cont2seal3,
      this.status,
      this.clientInformation,
      this.contNumber1,
      this.id,
      this.cont1seal1,
      this.onlySeal,
      this.companyId,
      this.cont1seal2,
      this.lockState,
      this.carfleedId,
      this.cont1seal3,
      this.timein,
      this.transportId,
      this.contNumber2,
      this.timeout,
      this.licensePlate,
      this.cont2seal1,
      this.intendTime,
      this.cont2seal2});

  FormIn.fromJson(Map<String, dynamic> json) {
    warehouse = json['warehouse'];
    cont2seal3 = json['cont2seal3'];
    status = json['status'];
    clientInformation = json['clientInformation'];
    contNumber1 = json['contNumber1'];
    id = json['id'];
    cont1seal1 = json['cont1seal1'];
    onlySeal = json['onlySeal'];
    companyId = json['companyId'];
    cont1seal2 = json['cont1seal2'];
    lockState = json['lockState'];
    carfleedId = json['carfleedId'];
    cont1seal3 = json['cont1seal3'];
    timein = json['timein'];
    transportId = json['transportId'];
    contNumber2 = json['contNumber2'];
    timeout = json['timeout'];
    licensePlate = json['licensePlate'];
    cont2seal1 = json['cont2seal1'];
    intendTime = json['intendTime'];
    cont2seal2 = json['cont2seal2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['warehouse'] = this.warehouse;
    data['cont2seal3'] = this.cont2seal3;
    data['status'] = this.status;
    data['clientInformation'] = this.clientInformation;
    data['contNumber1'] = this.contNumber1;
    data['id'] = this.id;
    data['cont1seal1'] = this.cont1seal1;
    data['onlySeal'] = this.onlySeal;
    data['companyId'] = this.companyId;
    data['cont1seal2'] = this.cont1seal2;
    data['lockState'] = this.lockState;
    data['carfleedId'] = this.carfleedId;
    data['cont1seal3'] = this.cont1seal3;
    data['timein'] = this.timein;
    data['transportId'] = this.transportId;
    data['contNumber2'] = this.contNumber2;
    data['timeout'] = this.timeout;
    data['licensePlate'] = this.licensePlate;
    data['cont2seal1'] = this.cont2seal1;
    data['intendTime'] = this.intendTime;
    data['cont2seal2'] = this.cont2seal2;
    return data;
  }
}

class Company {
  int? id;
  String? faxNumber;
  bool? status;
  String? name;
  String? address;

  Company({this.id, this.faxNumber, this.status, this.name, this.address});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    faxNumber = json['faxNumber'];
    status = json['status'];
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['faxNumber'] = faxNumber;
    data['status'] = status;
    data['name'] = name;
    data['address'] = address;
    return data;
  }
}

class WareHouse {
  String? id;
  String? name;

  WareHouse({this.id, this.name});

  WareHouse.fromJson(Map<String, dynamic> json) {
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

class CarFleed {
  String? name;
  bool? status;
  String? id;

  CarFleed({this.name, this.status, this.id});

  CarFleed.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['status'] = status;
    data['id'] = id;
    return data;
  }
}

class Transport {
  String? name;
  bool? status;
  String? id;

  Transport({this.name, this.status, this.id});

  Transport.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['status'] = status;
    data['id'] = id;
    return data;
  }
}
