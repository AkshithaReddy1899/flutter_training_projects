import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String apiUrl;

  NetworkHelper({required this.apiUrl});

  static getWeather(apiUrl) async {
    print('got url');
    var url = Uri.parse(apiUrl);
    var response = await http.get(url);
    
    if(response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      return jsonData;
    }else {
      print(response.statusCode);
    }
  }
}
