class WareHome {
  String? id;
  String? name;
  List<Gate>? gate;

  WareHome({this.id, this.name, this.gate});

  WareHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['gate'] != null) {
      gate = <Gate>[];
      json['gate'].forEach((v) {
        gate!.add( Gate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    if (gate != null) {
      data['gate'] = gate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gate {
  String? name;
  String? local;
  String? gateId;
  bool? status;
  int? id;

  Gate({this.name, this.local, this.gateId, this.status, this.id});

  Gate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    local = json['local'];
    gateId = json['gateId'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['local'] = local;
    data['gateId'] = gateId;
    data['status'] = status;
    data['id'] = id;
    return data;
  }
}