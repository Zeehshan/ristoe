import '../../../models/models/models.dart';

abstract class ApiProvider {
  Future<List<CategoryModel>> categories();
}
