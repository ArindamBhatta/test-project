import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  static Future<Map<String, dynamic>?> accessFirstData() async {
    String url1 = 'https://cp.altsome.com/api/web-home?sys_id=1';

    try {
      final response = await http.post(Uri.parse(url1));

      if (response.statusCode == 200) {
        print('Successfully loaded first API data JSON');
        Map<String, dynamic> data1 = json.decode(response.body);
        return data1;
      } else {
        print('Failed to load data1. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error occurred while loading first API data: $error');
      return null;
    }
  }
}
