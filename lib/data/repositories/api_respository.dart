import '../../models/models/models.dart';
import '../providers/providers.dart';

class ApiRepository {
  final ApiProvider apiProvider;
  ApiRepository() : apiProvider = ApiHttpProvider();

  Future<List<CategoryModel>> categories() async {
    try {
      return await apiProvider.categories();
    } catch (e) {
      rethrow;
    }
  }
}
