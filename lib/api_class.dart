import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class WheatherData {
  // 8a5e6d2e1558425391e95908232001
  Future<Wheather> getWhetherData(String place) async {
    try {
      final queryParameters = {
        'key': '8a5e6d2e1558425391e95908232001',
        'q': place,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Wheather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("can not get Whether");
      }
    } catch (e) {
      rethrow;
    }
  }
}
