import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PageControllerService with ReactiveServiceMixin {
  ReactiveValue<int> _currentBottomToolbarIndex =
      ReactiveValue<int>(0);

  ReactiveValue<PageController> _pageController =
      ReactiveValue<PageController>(PageController(initialPage: 0));

  PageControllerService() {
    listenToReactiveValues(
        [_currentBottomToolbarIndex, _pageController]);
  }

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
      duration: Duration(milliseconds: 500),
    );
  }
}
