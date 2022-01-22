import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/user_service.dart';

class ProfilePicModel extends BaseViewModel {
  final log = getLogger('ProfilePicModel');

  final _userService = locator<UserService>();

  String? get name => _userService.currentUser.fullName;
  String? get dorm => _userService.currentUser.dorm;

  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  String getProfilePicUrl() {
    // temporary url. need to get from firestore w/ google auth key
    final _userService = locator<UserService>();
    if (_userService.currentUser.email ==
        "phoebe.yu@vanderbilt.edu") {
      return "https://media-exp1.licdn.com/dms/image/C5603AQFqD48GtbTIDg/profile-displayphoto-shrink_200_200/0/1619061404266?e=1646265600&v=beta&t=aWqyGBqE5bNxpKA0lnNf7E-S7TUCAhlVHkgVxtAr2Xk";
    } else if (_userService.currentUser.email ==
        "jane.sun@vanderbilt.edu") {
      return "https://media-exp1.licdn.com/dms/image/C4E03AQEuduKDQ_CqiQ/profile-displayphoto-shrink_200_200/0/1640821197194?e=1646265600&v=beta&t=PIarCFZMaupOYgPjl4zsUZH5sIephR-drplAZ_KzM1I";
    } else if (_userService.currentUser.email ==
        "zi.nean.teoh@vanderbilt.edu") {
      return 'https://media-exp1.licdn.com/dms/image/C4D03AQFb-rbxfzH4kw/profile-displayphoto-shrink_800_800/0/1603352495322?e=1645660800&v=beta&t=-GPc3x2VzeBNu-pIiFl3Lt0o-oO-HyUg1GAFqqeC4wg';
    } else {
      return "";
    }
  }
}
