import 'package:stacked/stacked.dart';

class TopProfileBarModel extends BaseViewModel {
  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  String getProfilePicUrl() {
    // temporary url. need to get from firestore w/ google auth key
    return 'https://media-exp1.licdn.com/dms/image/C4D03AQFb-rbxfzH4kw/profile-displayphoto-shrink_800_800/0/1603352495322?e=1645660800&v=beta&t=-GPc3x2VzeBNu-pIiFl3Lt0o-oO-HyUg1GAFqqeC4wg';
  }
}
