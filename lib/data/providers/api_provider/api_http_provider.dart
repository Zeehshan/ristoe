import 'package:dio/dio.dart';

import '../../../config/apis/apis.dart';
import '../../../models/models/models.dart';
import '../providers.dart';

class ApiHttpProvider extends BaseApiProvider implements ApiProvider {
  @override
  Future<List<CategoryModel>> categories({int? after}) async {
    try {
      String path = BackendApi.categories;
      Response response = await backendApiReq.get(path);
      return (response.data as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
