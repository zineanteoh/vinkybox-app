import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/page_controller_service.dart';

class BottomToolbarModel extends ReactiveViewModel {
  final _pageControllerService = locator<PageControllerService>();

  int get currentIndex =>
      _pageControllerService.currentBottomToolbarIndex;

  void setCurrentIndex(index) {
    _pageControllerService.setBottomToolbarIndex(index);
    animateToPage(index);
  }

  void animateToPage(int index) {
    _pageControllerService.animateToPageWithController(index);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [_pageControllerService];
}
