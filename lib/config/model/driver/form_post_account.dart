class FormRegisterCar {
  String? carfleedId;
  int? companyId;
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

  FormRegisterCar(
      {this.carfleedId,
      this.companyId,
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

  FormRegisterCar.fromJson(Map<String, dynamic> json) {
    carfleedId = json['carfleedId'];
    companyId = json['companyId'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carfleedId'] = carfleedId;
    data['companyId'] = companyId;
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
    return data;
  }
}
