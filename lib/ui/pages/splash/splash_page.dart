import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes/app_pages.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      Get.offAllNamed(AppRoutes.categories);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
