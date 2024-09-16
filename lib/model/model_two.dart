class ModelTwo {
  String? key;
  String? error;
  Data? data;

  ModelTwo.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    error = json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

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

class Data {
  List<dynamic>? tt;
  List<dynamic>? tr;
  List<dynamic>? tg;
  List<dynamic>? tl;
  List<dynamic>? rt;
  Map<String, Detail>? details;

  Data.fromJson(Map<String, dynamic> json) {
    tt = List<int>.from(json['tt']);
    tr = List<int>.from(json['tr']);
    tg = List<int>.from(json['tg']);
    tl = List<int>.from(json['tl']);
    rt = List<int>.from(json['rt']);

    if (json['details'] != null) {
      details = (json['details'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, Detail.fromJson(value)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tt'] = this.tt;
    data['tr'] = this.tr;
    data['tg'] = this.tg;
    data['tl'] = this.tl;
    data['rt'] = this.rt;
    if (this.details != null) {
      data['details'] =
          this.details!.map((key, value) => MapEntry(key, value.toJson()));
    }
    return data;
  }
}

class Detail {
  var id;
  String? sg;
  String? s;
  String? n;
  var ms;
  var cs;
  var ts;
  String? p;
  var mc;
  var r;
  int? p1;
  int? p7;
  int? p30;
  var v;
  var fdv;
  String? o;
  String? h;
  String? l;
  int? mcp;
  var vp;
  List<dynamic>? sl;
  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sg = json['sg'];
    s = json['s'];
    n = json['n'];
    ms = json['ms'];
    cs = json['cs'];
    ts = json['ts'];
    p = json['p'];
    mc = json['mc'];
    r = json['r'];

    // Handle the case where the number could be a double
    p1 = (json['p1'] is int) ? json['p1'] : (json['p1'] as num?)?.toInt();
    p7 = (json['p7'] is int) ? json['p7'] : (json['p7'] as num?)?.toInt();
    p30 = (json['p30'] is int) ? json['p30'] : (json['p30'] as num?)?.toInt();

    v = json['v'];
    fdv = json['fdv'];
    o = json['o'];
    h = json['h'];
    l = json['l'];

    // Handle mcp similarly
    mcp = (json['mcp'] is int) ? json['mcp'] : (json['mcp'] as num?)?.toInt();

    vp = json['vp'];

    // Convert 'sl' list elements to doubles
    sl = (json['sl'] as List?)?.map((e) => (e as num).toDouble()).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['sg'] = this.sg;
    data['s'] = this.s;
    data['n'] = this.n;
    data['ms'] = this.ms;
    data['cs'] = this.cs;
    data['ts'] = this.ts;
    data['p'] = this.p;
    data['mc'] = this.mc;
    data['r'] = this.r;
    data['p1'] = this.p1;
    data['p7'] = this.p7;
    data['p30'] = this.p30;
    data['v'] = this.v;
    data['fdv'] = this.fdv;
    data['o'] = this.o;
    data['h'] = this.h;
    data['l'] = this.l;
    data['mcp'] = this.mcp;
    data['vp'] = this.vp;
    data['sl'] = this.sl;
    return data;
  }
}
