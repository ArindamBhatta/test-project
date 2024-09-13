class ModelOne {
  String? key;
  String? error;
  Data? data;

  ModelOne({this.key, this.error, this.data}); //? constructor

  //The fromJson method is a factory constructor used to create a Dart object from a JSON Map.
  ModelOne.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    error = json['error'];
    data = (json['data'] != null) ? new Data.fromJson(json['data']) : null;
  }
  //? now JsonModelOne have three fields => key, error, and data.

  //store value in the key
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['key'] = this.key;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
//toJson is a method used to convert the Dart object to a JSON Map.

class Data {
  Mc? mc;
  Mc? v;
  Mc? b;
  Mc? e;
  Fg? fg;
  List<double>? smc;
  List<double>? sv;
  List<double>? sb;
  List<double>? se;

  Data({
    this.mc,
    this.v,
    this.b,
    this.e,
    this.fg,
    this.smc,
    this.sv,
    this.sb,
    this.se,
  });

  Data.fromJson(Map<String, dynamic> json) {
    mc = (json['mc'] != null) ? new Mc.fromJson(json['mc']) : null;
    v = (json['v'] != null) ? new Mc.fromJson(json['v']) : null;
    b = (json['b'] != null) ? new Mc.fromJson(json['b']) : null;
    e = (json['e'] != null) ? new Mc.fromJson(json['e']) : null;
    fg = (json['fg'] != null) ? new Fg.fromJson(json['fg']) : null;
    smc = json['smc'].cast<double>();
    sv = json['sv'].cast<double>();
    sb = json['sb'].cast<double>();
    se = json['se'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.mc != null) {
      data['mc'] = this.mc?.toJson();
    }
    if (this.v != null) {
      data['v'] = this.v?.toJson();
    }
    if (this.b != null) {
      data['b'] = this.b?.toJson();
    }
    if (this.e != null) {
      data['e'] = this.e?.toJson();
    }
    if (this.fg != null) {
      data['fg'] = this.fg?.toJson();
    }
    data['smc'] = this.smc;
    data['sv'] = this.sv;
    data['sb'] = this.sb;
    data['se'] = this.se;
    return data;
  }
}

class Mc {
  String? v;
  String? c;

  Mc({this.v, this.c});

  Mc.fromJson(Map<String, dynamic> json) {
    v = json['v'];
    c = json['c'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['v'] = this.v;
    data['c'] = this.c;
    return data;
  }
}

class Fg {
  String? tv;
  String? tc;
  List<H>? h;

  Fg({this.tv, this.tc, this.h});

  Fg.fromJson(Map<String, dynamic> json) {
    tv = json['tv'];
    tc = json['tc'];
    if (json['h'] != null) {
      h = <H>[];
      json['h'].forEach((v) {
        h?.add(new H.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tv'] = this.tv;
    data['tc'] = this.tc;
    if (this.h != null) {
      data['h'] = this.h!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class H {
  int? v;
  String? c;
  String? t;
  String? cc;

  H({this.v, this.c, this.t, this.cc});

  H.fromJson(Map<String, dynamic> json) {
    v = json['v'];
    c = json['c'];
    t = json['t'];
    cc = json['cc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['v'] = this.v;
    data['c'] = this.c;
    data['t'] = this.t;
    data['cc'] = this.cc;
    return data;
  }
}
