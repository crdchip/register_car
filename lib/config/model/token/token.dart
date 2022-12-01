// ignore_for_file: non_constant_identifier_names

class Tokens {
  String? access_token;
  String? token_type;

  Tokens({
    this.access_token,
    this.token_type,
  });
  Tokens.fromJson(Map<String, dynamic> json) {
    access_token = json['access_token'];
    token_type = json['token_type'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = access_token;
    data['token_type'] = token_type;
    return data;
  }
}
