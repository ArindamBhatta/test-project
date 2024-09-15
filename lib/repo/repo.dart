import '../model/model_one.dart';
import '../service/service.dart';

abstract class Repo {
  static Future<ModelOne?> accessFirstApi() async {
    try {
      Map<String, dynamic>? data = await Service.accessFirstData();
      ModelOne modelOne = ModelOne.changeToDartSyntax(data!);
      return modelOne;
    } catch (error) {
      print('Error fetching data: $error');
    }

    return null;
  }

  static Future<Map<String, dynamic>?> accessSecondApi() async {
    try {
      Map<String, dynamic>? data = await Service.accessSecondData();
      print((data?['data']['details']['1']['mc']).runtimeType);
      return data;
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }
}
