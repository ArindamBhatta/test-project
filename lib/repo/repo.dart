import 'package:home_page/model/model_three.dart';
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

      return modelTwo;
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }

  static Future<Map<String, dynamic>?> accessSectorsApi() async {
    try {
      Map<String, dynamic>? data = await Service.accessSectorsData();
      ModelThree modelThree = ModelThree.fromJson(data!);
      print('print one dart value  ${modelThree.data![0].n}');
      return data;
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }
}
