import 'package:get/get.dart';

import '../data/repositories/repositories.dart';
import '../models/models/models.dart';
import '../utils/utils.dart';

class CategoryController extends GetxController {
  final ApiRepository _apiRepository = Get.find();

  List<CategoryModel> categories = [];

  ControllerStateUIStatus stateUIStatus = ControllerStateUIStatus.loading;

  @override
  void onInit() {
    super.onInit();
    _loadCategory();
  }

  _loadCategory() async {
    try {
      categories = await _apiRepository.categories();
      stateUIStatus = ControllerStateUIStatus.loaded;
      update();
    } catch (e) {
      stateUIStatus = ControllerStateUIStatus.error;
      update();
    }
  }
}
