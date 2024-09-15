class ModelTwo {
  final String key;
  final String error;
  final Data data;

  ModelTwo({
    required this.key,
    required this.error,
    required this.data,
  });

  factory ModelTwo.fromJson(Map<String, dynamic> json) {
    return ModelTwo(
      key: json['key'],
      error: json['error'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'error': error,
      'data': data.toJson(),
    };
  }
}

class Data {
  final List<int> tt;
  final List<int> tr;
  final List<int> tg;
  final List<int> tl;
  final List<int> rt;
  final Map<String, Details> details;

  Data({
    required this.tt,
    required this.tr,
    required this.tg,
    required this.tl,
    required this.rt,
    required this.details,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var detailsMap = (json['details'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(key, Details.fromJson(value)),
    );

    return Data(
      tt: List<int>.from(json['tt']),
      tr: List<int>.from(json['tr']),
      tg: List<int>.from(json['tg']),
      tl: List<int>.from(json['tl']),
      rt: List<int>.from(json['rt']),
      details: detailsMap,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tt': tt,
      'tr': tr,
      'tg': tg,
      'tl': tl,
      'rt': rt,
      'details': details.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

class Details {
  final int id;
  final String sg;
  final String s;
  final String n;
  final int? ms;
  final double cs;
  final double ts;
  final String p;
  final int mc;
  final int r;
  final double p1;
  final double p7;
  final double p30;
  final int v;
  final int fdv;
  final String o;
  final String h;
  final String l;
  final double mcp;
  final double vp;
  final List<double> sl;

  Details({
    required this.id,
    required this.sg,
    required this.s,
    required this.n,
    required this.ms,
    required this.cs,
    required this.ts,
    required this.p,
    required this.mc,
    required this.r,
    required this.p1,
    required this.p7,
    required this.p30,
    required this.v,
    required this.fdv,
    required this.o,
    required this.h,
    required this.l,
    required this.mcp,
    required this.vp,
    required this.sl,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      id: json['id'],
      sg: json['sg'],
      s: json['s'],
      n: json['n'],
      ms: json['ms'],
      cs: (json['cs'] as num).toDouble(),
      ts: (json['ts'] as num).toDouble(),
      p: json['p'],
      mc: json['mc'],
      r: json['r'],
      p1: (json['p1'] as num).toDouble(),
      p7: (json['p7'] as num).toDouble(),
      p30: (json['p30'] as num).toDouble(),
      v: json['v'],
      fdv: json['fdv'],
      o: json['o'],
      h: json['h'],
      l: json['l'],
      mcp: (json['mcp'] as num).toDouble(),
      vp: (json['vp'] as num).toDouble(),
      sl: List<double>.from(json['sl'].map((x) => (x as num).toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sg': sg,
      's': s,
      'n': n,
      'ms': ms,
      'cs': cs,
      'ts': ts,
      'p': p,
      'mc': mc,
      'r': r,
      'p1': p1,
      'p7': p7,
      'p30': p30,
      'v': v,
      'fdv': fdv,
      'o': o,
      'h': h,
      'l': l,
      'mcp': mcp,
      'vp': vp,
      'sl': sl,
    };
  }
}
