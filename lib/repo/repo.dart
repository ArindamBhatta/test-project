import '../service_repo/service.dart';

abstract class Repo {
  static Future<Map<String, dynamic>?> fetchData() async {
    try {
      Map<String, dynamic>? data = await FetchDataService.fetchData();
      print(data?.length);
      return data;
    } catch (error) {
      print('Error fetching data: $error');
    }

    return null;
  }
}
