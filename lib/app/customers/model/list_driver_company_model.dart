class ListDriverCompanyModel {
  UserCompany? userCompany;
  ClientCompany? clientCompany;

  ListDriverCompanyModel({this.userCompany, this.clientCompany});

  ListDriverCompanyModel.fromJson(Map<String, dynamic> json) {
    userCompany =
        json['User'] != null ? UserCompany.fromJson(json['User']) : null;
    clientCompany =
        json['Client'] != null ? ClientCompany.fromJson(json['Client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (userCompany != null) {
      data['User'] = userCompany!.toJson();
    }
    if (clientCompany != null) {
      data['Client'] = clientCompany!.toJson();
    }
    return data;
  }
}

class UserCompany {
  int? id;
  bool? status;
  String? username;
  String? password;

  UserCompany({this.id, this.status, this.username, this.password});

  UserCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['status'] = status;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}

class ClientCompany {
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

  ClientCompany(
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

  ClientCompany.fromJson(Map<String, dynamic> json) {
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
