import '../model/model_one.dart';

import '../service/service.dart';

abstract class Repo {
  static Future<ModelOne?> accessFirstApi() async {
    try {
      Map<String, dynamic>? data = await Service.accessFirstData();
      ModelOne modelOne = ModelOne.changeToDartSyntax(data!);
      print('print one value ${modelOne.data?.mc?.v}');
      return modelOne;
    } catch (error) {
      print('Error fetching data: $error');
    }

    return null;
  }
}
