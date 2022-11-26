class ListFormDriver {
  int? id;
  String? contNumber1;
  bool? status;
  int? clientInformation;
  String? cont1seal1;
  bool? onlySeal;
  int? companyId;
  String? cont1seal2;
  bool? lockState;
  String? carfleedId;
  String? cont1seal3;
  String? transportId;
  String? contNumber2;
  String? licensePlate;
  String? cont2seal1;
  String? intendTime;
  String? cont2seal2;
  String? warehouse;
  String? cont2seal3;
  String? companyname;
  String? carfleedname;
  String? transportname;
  String? warehousename;

  ListFormDriver(
      {this.id,
      this.contNumber1,
      this.status,
      this.clientInformation,
      this.cont1seal1,
      this.onlySeal,
      this.companyId,
      this.cont1seal2,
      this.lockState,
      this.carfleedId,
      this.cont1seal3,
      this.transportId,
      this.contNumber2,
      this.licensePlate,
      this.cont2seal1,
      this.intendTime,
      this.cont2seal2,
      this.warehouse,
      this.cont2seal3,
      this.companyname,
      this.carfleedname,
      this.transportname,
      this.warehousename});

  ListFormDriver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contNumber1 = json['contNumber1'];
    status = json['status'];
    clientInformation = json['clientInformation'];
    cont1seal1 = json['cont1seal1'];
    onlySeal = json['onlySeal'];
    companyId = json['companyId'];
    cont1seal2 = json['cont1seal2'];
    lockState = json['lockState'];
    carfleedId = json['carfleedId'];
    cont1seal3 = json['cont1seal3'];
    transportId = json['transportId'];
    contNumber2 = json['contNumber2'];
    licensePlate = json['licensePlate'];
    cont2seal1 = json['cont2seal1'];
    intendTime = json['intendTime'];
    cont2seal2 = json['cont2seal2'];
    warehouse = json['warehouse'];
    cont2seal3 = json['cont2seal3'];
    companyname = json['companyname'];
    carfleedname = json['carfleedname'];
    transportname = json['transportname'];
    warehousename = json['warehousename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['contNumber1'] = contNumber1;
    data['status'] = status;
    data['clientInformation'] = clientInformation;
    data['cont1seal1'] = cont1seal1;
    data['onlySeal'] = onlySeal;
    data['companyId'] = companyId;
    data['cont1seal2'] = cont1seal2;
    data['lockState'] = lockState;
    data['carfleedId'] = carfleedId;
    data['cont1seal3'] = cont1seal3;
    data['transportId'] = transportId;
    data['contNumber2'] = contNumber2;
    data['licensePlate'] = licensePlate;
    data['cont2seal1'] = cont2seal1;
    data['intendTime'] = intendTime;
    data['cont2seal2'] = cont2seal2;
    data['warehouse'] = warehouse;
    data['cont2seal3'] = cont2seal3;
    data['companyname'] = companyname;
    data['carfleedname'] = carfleedname;
    data['transportname'] = transportname;
    data['warehousename'] = warehousename;
    return data;
  }
}
