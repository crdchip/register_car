class UserModel {
  Client? client;
  Role? role;

  UserModel({this.client, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (role != null) {
      data['role'] = role!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? dataimg;
  int? companyId;

  Client(
      {id,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.dataimg,
      this.companyId});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    dataimg = json['dataimg'];
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['dataimg'] = dataimg;
    data['companyId'] = companyId;
    return data;
  }
}

class Role {
  int? id;
  String? roleName;
  bool? status;

  Role({this.id, this.roleName, this.status});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['roleName'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['roleName'] = roleName;
    data['status'] = status;
    return data;
  }
}
