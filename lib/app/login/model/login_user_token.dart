class UserToken {
  String? accessToken;
  String? tokenType;
  Dictdata? dictdata;

  UserToken({this.accessToken, this.tokenType, this.dictdata});

  UserToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    dictdata =
        json['dictdata'] != null ? Dictdata.fromJson(json['dictdata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    if (dictdata != null) {
      data['dictdata'] = dictdata!.toJson();
    }
    return data;
  }
}

class Dictdata {
  int? id;
  String? username;
  Client? client;
  Role? role;

  Dictdata({this.id, this.username, this.client, this.role});

  Dictdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    client = json['Client'] != null ? Client.fromJson(json['Client']) : null;
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    if (client != null) {
      data['Client'] = client!.toJson();
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
      {this.id,
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['roleName'] = roleName;
    data['status'] = status;
    return data;
  }
}
