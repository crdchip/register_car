class WareHome {
  String? id;
  String? name;
  List<Gate>? gateLeft;
  List<Gate>? gateRight;

  WareHome({this.id, this.name, this.gateLeft, this.gateRight});

  WareHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['gate_left'] != null) {
      gateLeft = <Gate>[];
      json['gate_left'].forEach((v) {
        gateLeft!.add(Gate.fromJson(v));
      });
    }
    if (json['gate_right'] != null) {
      gateRight = <Gate>[];
      json['gate_right'].forEach((v) {
        gateRight!.add(Gate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (gateLeft != null) {
      data['gate_left'] = gateLeft!.map((v) => v.toJson()).toList();
    }
    if (gateRight != null) {
      data['gate_right'] = gateRight!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gate {
  int? id;
  String? name;
  String? local;
  bool? status;
  List<Lines>? lines;

  Gate({this.id, this.name, this.local, this.status, this.lines});

  Gate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    local = json['local'];
    status = json['status'];
    if (json['lines'] != null) {
      lines = <Lines>[];
      json['lines'].forEach((v) {
        lines!.add(Lines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['local'] = local;
    data['status'] = status;
    if (lines != null) {
      data['lines'] = lines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lines {
  int? id;
  String? name;
  bool? status;

  Lines({this.id, this.name, this.status});

  Lines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
