import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/bindings/bindings.dart';
import 'config/routes/app_pages.dart';
import 'data/providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();
  runApp(RistoeApp());
}

Future<void> initServices() async {
  Get.put<ApiProvider>(
    ApiHttpProvider(),
    permanent: true,
  );
}

class RistoeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      themeMode: ThemeMode.light,
      initialRoute: AppPages.initial,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
    );
  }
}
