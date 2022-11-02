class Users {
  String? username;
  String? password;
  // String? password;
  // bool? is_active;

  Users({
    required this.username,
    required this.password,
    // required this.email,
    // required this.is_active,
  });
  Users.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    password = json["password"];
    // password = json["password"];
    // is_active = json["is_active"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["password"] = password;
    // data["password"] = password;
    // data["is_active"] = is_active;
    return data;
  }
}
