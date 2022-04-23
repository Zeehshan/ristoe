import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../controllers/controllers.dart';

class ListCategoryWidget extends StatefulWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const ListCategoryWidget({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<ListCategoryWidget> createState() => _ListCategoryWidgetState();
}

class _ListCategoryWidgetState extends State<ListCategoryWidget> {
  AutoScrollController? _autoScrollControllerCat;

  @override
  void initState() {
    super.initState();

    _autoScrollControllerCat = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    )..addListener(() {});
  }

  Widget _wrapScrollTag({int? index, Widget? child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollControllerCat!,
      index: index!,
      child: child!,
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }

  Future _scrollToIndex(int index) async {
    _autoScrollControllerCat!
        .scrollToIndex(index, preferPosition: AutoScrollPosition.middle);
  }

  @override
  Widget build(BuildContext context) {
    final CategoryController _controller = Get.find();
    return Container(
      width: 140,
      child: ListView(
        controller: _autoScrollControllerCat,
        children: List.generate(
            _controller.categories.length,
            (index) => _wrapScrollTag(
                  index: index,
                  child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {
                            widget.onTap(index);
                            _scrollToIndex(index);
                          },
                          child: Text(
                            _controller.categories[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: widget.selectedIndex != index
                                        ? Colors.grey
                                        : Theme.of(context).primaryColor),
                          ))),
                )),
      ),
    );
  }
}
