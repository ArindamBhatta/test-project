import '../service/service.dart';

abstract class Repo {
  static Future<Map<String, dynamic>?> fetchData() async {
    try {
      Map<String, dynamic>? data = await Service.accessFirstData();
      print(data?.length);
      return data;
    } catch (error) {
      print('Error fetching data: $error');
    }

    return null;
  }
}
