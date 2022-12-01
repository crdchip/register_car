class FormProduct {
  String? company;
  String? vehicle;
  bool? ischeckProduct;
  bool? ischeckNoProduct;
  String? seal1;
  String? seal2;
  String? seal3;
  String? numberCar;
  String? timeReal;

  FormProduct(
      {this.company,
      this.vehicle,
      this.ischeckProduct,
      this.ischeckNoProduct,
      this.seal1,
      this.seal2,
      this.seal3,
      this.numberCar,
      this.timeReal});
  FormProduct.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    vehicle = json['vehicle'];
    ischeckProduct = json['ischeckProduct'];
    ischeckNoProduct = json['ischeckNoProduct'];
    seal1 = json['seal1'];
    seal2 = json['seal2'];
    seal3 = json['seal3'];
    numberCar = json['numberCar'];
    timeReal = json['timeReal'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company'] = company;
    data['vehicle'] = vehicle;
    data['ischeckProduct'] = ischeckProduct;
    data['ischeckNoProduct'] = ischeckNoProduct;
    data['seal1'] = seal1;
    data['seal2'] = seal2;
    data['seal3'] = seal3;
    data['numberCar'] = numberCar;
    data['timeReal'] = timeReal;

    return data;
  }
}
