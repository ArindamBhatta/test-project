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

  static Future<ModelThree?> accessSectorsApi() async {
    try {
      Map<String, dynamic>? data =
          await Service.accessSectorsData() as Map<String, dynamic>;
      ModelThree modelThree = ModelThree.fromJson(data);
      print("ModelThree: $modelThree.data.length");
      return modelThree;
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }
}
