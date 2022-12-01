class PutTracking2 {
  int? lineid;
  int? strackingid;

  PutTracking2({this.lineid, this.strackingid});

  PutTracking2.fromJson(Map<String, dynamic> json) {
    lineid = json['lineid'];
    strackingid = json['strackingid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lineid'] = lineid;
    data['strackingid'] = strackingid;
    return data;
  }
}
