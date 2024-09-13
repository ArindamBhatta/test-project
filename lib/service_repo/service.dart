import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchDataService {
  static late Map<String, dynamic>? data2;
  static Future<Map<String, dynamic>?> fetchData() async {
    try {
      //* Define both URLs
      String url1 = 'https://cp.altsome.com/api/web-home?sys_id=1';
      String url2 =
          'https://cp.altsome.com/api/web-home-coins?sys_id=1&currency=usd';

      final responses = await Future.wait([
        http.post(Uri.parse(url1)),
        http.post(Uri.parse(url2)),
      ]);
      if (responses[0].statusCode == 200) {
        print(' successfully load first API data JSON');
        Map<String, dynamic>? data1 = json.decode(responses[0].body);
        return data1;
      } else {
        print('Failed to load data. Status code: ${responses[0].statusCode}');
      }

      if (responses[1].statusCode == 200) {
        print(' successfully load second API data JSON');
        data2 = json.decode(responses[1].body);
      } else {
        print('Failed to load data. Status code: ${responses[1].statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }

    return null;
  }
}
