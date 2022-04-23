import 'package:get/get.dart';

import '../../ui/pages/categories/categories_page.dart';
import '../../ui/pages/pages.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashPage()),
    GetPage(name: AppRoutes.categories, page: () => CategoriesPage()),
  ];
}
