import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final CategoryController _controller = Get.find();

  AutoScrollController? _autoScrollController;

  final Map<int, bool> _visibleItems = {0: true};

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    )..addListener(() {});
  }

  void _calculateIndexAndJumpToCategory(Map<int, bool> visibleItems) async {
    try {
      List<int> indexes = List.from(_visibleItems.keys.toList());
      indexes.sort();
      int topMostVisibleItem = indexes.first;
      setState(() {
        _index = topMostVisibleItem;
      });
    } catch (e) {}
  }

  Future _scrollToIndex(int index) async {
    setState(() {
      _index = index;
    });
    _autoScrollController!
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
  }

  Widget _wrapScrollTag({int? index, Widget? child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController!,
      index: index!,
      child: child!,
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListCategoryWidget(
          onTap: _scrollToIndex,
          selectedIndex: _index,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 60,
                alignment: Alignment.center,
                child: Text(_controller.categories[_index].title),
              ),
              Flexible(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  controller: _autoScrollController,
                  children: List.generate(
                      _controller.categories.length,
                      (index) => VisibilityDetector(
                            key: Key(
                                _controller.categories[index].id.toString()),
                            onVisibilityChanged: (info) {
                              var visiblePercentage =
                                  info.visibleFraction * 100;
                              if (visiblePercentage > 20) {
                                _visibleItems.putIfAbsent(index, () => true);
                              } else {
                                _visibleItems.remove(index);
                              }

                              _calculateIndexAndJumpToCategory(_visibleItems);
                            },
                            child: _wrapScrollTag(
                              index: index,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_index != index)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          _controller.categories[index].title),
                                    ),
                                  Column(
                                    children: _controller
                                        .categories[index].dishes
                                        .map((item) => Container(
                                              height: 110,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 6),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 4),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: Colors.white),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: 90,
                                                      height: 90,
                                                      child: Image.network(
                                                        item.img,
                                                        fit: BoxFit.cover,
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(item.name),
                                                        Spacer(),
                                                        Row(
                                                          children: [
                                                            Text(item.price),
                                                            Spacer(),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 18,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
