class ResponseModel {
  List<Weather>? weather;
  Main? main;
  String? name;
  int? cod;

  ResponseModel({this.weather, this.main, this.name, this.cod});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    data['name'] = this.name;
    data['cod'] = this.cod;
    return data;
  }
}

class Weather {
  int? id;

  Weather({this.id});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Main {
  double? temp;

  Main({this.temp});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    return data;
  }
}
