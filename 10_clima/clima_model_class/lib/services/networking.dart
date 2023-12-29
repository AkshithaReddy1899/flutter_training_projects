import 'dart:convert';
import '../services/data.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String apiUrl;
  static late var location;

  NetworkHelper({required this.apiUrl});

  static Future<ResponseModel> fetchWeather(apiurl) async {
    final response  = await http.get(Uri.parse(apiurl));
    print(response);
    
    if (response.statusCode == 200) {
      return ResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
