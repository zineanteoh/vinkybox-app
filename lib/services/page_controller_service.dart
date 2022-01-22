import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PageControllerService with ReactiveServiceMixin {
  PageControllerService() {
    listenToReactiveValues(
        [_currentBottomToolbarIndex, _pageController]);
  }

  final ReactiveValue<int> _currentBottomToolbarIndex =
      ReactiveValue<int>(0);

  final ReactiveValue<PageController> _pageController =
      ReactiveValue<PageController>(PageController(initialPage: 0));

  int get currentBottomToolbarIndex =>
      _currentBottomToolbarIndex.value;

  PageController get pageController => _pageController.value;

  void setBottomToolbarIndex(index) {
    _currentBottomToolbarIndex.value = index;
  }

  void animateToPageWithController(index) {
    _pageController.value.animateToPage(
      index,
      curve: Curves.easeInBack,
      duration: const Duration(milliseconds: 300),
    );
  }
}
