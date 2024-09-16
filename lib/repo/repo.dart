import 'package:home_page/model/model_two.dart';

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

  static Future<ModelTwo?> accessSecondApi() async {
    try {
      Map<String, dynamic>? data = await Service.accessSecondData();
      ModelTwo modelTwo = ModelTwo.fromJson(data!);
      print("access from dart ${modelTwo.data!.tt}");
      print("access from dart key ${modelTwo.data!.details!['1']?.sg}");
      return modelTwo;
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }
}
