import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CategoryController>(
          init: CategoryController(),
          builder: (controller) {
            switch (controller.stateUIStatus) {
              case ControllerStateUIStatus.loading:
                return LoadingWidget();
              case ControllerStateUIStatus.loaded:
                return BodyWidget();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
