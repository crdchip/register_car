class LaneCar {
  int? id;
  String? name;
  List<ClientLane>? client_right;
  List<ClientLane>? client_left;

  LaneCar({this.id, this.name, this.client_right, this.client_left});

  LaneCar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['client_right'] != null) {
      client_right = <ClientLane>[];
      json['client_right'].forEach((v) {
        client_right!.add(ClientLane.fromJson(v));
      });
    }
    if (json['client_left'] != null) {
      client_left = <ClientLane>[];
      json['client_left'].forEach((v) {
        client_left!.add(ClientLane.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    if (client_right != null) {
      data['client_right'] = client_right!.map((v) => v.toJson()).toList();
    }
    if (client_left != null) {
      data['client_left'] = client_left!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientLane {
  Lane? lane1;
  Lane? lane2;
  Lane? lane3;

  ClientLane({this.lane1, this.lane2, this.lane3});

  ClientLane.fromJson(Map<String, dynamic> json) {
    lane1 = json['lane1'] != null ? Lane.fromJson(json['lane1']) : null;
    lane2 = json['lane2'] != null ? Lane.fromJson(json['lane2']) : null;
    lane3 = json['lane3'] != null ? Lane.fromJson(json['lane3']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (lane1 != null) {
      data['lane1'] = lane1!.toJson();
    }
    if (lane2 != null) {
      data['lane2'] = lane2!.toJson();
    }
    if (lane3 != null) {
      data['lane3'] = lane3!.toJson();
    }
    return data;
  }
}

class Lane {
  String? name;
  bool? statusChildren;

  Lane({this.name, this.statusChildren});

  Lane.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    statusChildren = json['status_children'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['status_children'] = statusChildren;
    return data;
  }
}
