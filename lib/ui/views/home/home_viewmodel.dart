import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _title = 'HomeView';
  String get title => '$_title counter: $_counter';

  // For demo purposes
  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }
}
