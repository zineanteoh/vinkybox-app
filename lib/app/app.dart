import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/services/firebase_authentication_service.dart';
import 'package:vinkybox/services/user_service.dart';
import 'package:vinkybox/ui/views/home/home_view.dart';
import 'package:vinkybox/ui/views/login/login_view.dart';
import 'package:vinkybox/ui/views/marketplace/marketplace_view.dart';
import 'package:vinkybox/ui/views/onboarding/onboarding_view.dart';
import 'package:vinkybox/ui/views/onboarding/settings/dorm_selection/dorm_selection_view.dart';
import 'package:vinkybox/ui/views/request_delivery/request_delivery_view.dart';
import 'package:vinkybox/ui/views/startup/startup_view.dart';

// Run the following to regenerate app files:
// flutter pub run build_runner build --delete-conflicting-outputs

@StackedApp(
  // Auto generate app.router.dart
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: OnboardingView),
    CupertinoRoute(page: DormSelectionView),
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: RequestDeliveryView),
    CupertinoRoute(page: MarketPlaceView),
  ],

  // Auto generate app.locator.dart
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreApi),
    Singleton(classType: FirebaseAuthenticationService),
  ],

  // Auto generate app.logger.dart
  logger: StackedLogger(),
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
