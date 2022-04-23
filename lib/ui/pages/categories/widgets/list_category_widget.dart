import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class ListCategoryWidget extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const ListCategoryWidget(
      {Key? key, required this.onTap, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryController _controller = Get.find();
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            _controller.categories.length,
            (index) => Container(
                width: 140,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: TextButton(
                    onPressed: () {
                      onTap(index);
                    },
                    child: Text(
                      _controller.categories[index].title,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: selectedIndex != index
                              ? Colors.grey
                              : Theme.of(context).primaryColor),
                    )))),
      ),
    );
  }
}
