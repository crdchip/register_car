class Token {
  String? access_token;
  String? token_type;
  Token({this.access_token, this.token_type});
  Token.fromJson(Map<String, dynamic> json) {
    access_token = json["access_token"];
    token_type = json["token_type"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["access_token"] = access_token;
    data["token_type"] = token_type;
    return data;
  }
}
