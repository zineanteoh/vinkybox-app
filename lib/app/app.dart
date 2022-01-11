import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/api/firebase_database_api.dart';
import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/services/delivery_service.dart';
import 'package:vinkybox/services/firebase_authentication_service.dart';
import 'package:vinkybox/services/google_map_service.dart';
import 'package:vinkybox/services/location_tracking_service.dart';
import 'package:vinkybox/services/package_tracking_service.dart';
import 'package:vinkybox/services/page_controller_service.dart';
import 'package:vinkybox/services/user_service.dart';
import 'package:vinkybox/ui/views/deliver_for_others/deliver_for_others_view.dart';
import 'package:vinkybox/ui/views/delivery/current_tasks/current_tasks_view.dart';
import 'package:vinkybox/ui/views/delivery/request_delivery/request_delivery_view.dart';
import 'package:vinkybox/ui/views/home/home_view.dart';
import 'package:vinkybox/ui/views/location/location_view.dart';
import 'package:vinkybox/ui/views/login/login_view.dart';
import 'package:vinkybox/ui/views/marketplace/marketplace_view.dart';
import 'package:vinkybox/ui/views/delivery/my_packages/my_packages_view.dart';
import 'package:vinkybox/ui/views/onboarding/onboarding_view.dart';
import 'package:vinkybox/ui/views/onboarding/dorm_selection/dorm_selection_view.dart';
import 'package:vinkybox/ui/views/startup/startup_view.dart';

// Run the following to regenerate app files:
// flutter pub run build_runner build --delete-conflicting-outputs

@StackedApp(
  // Auto generate app.router.dart
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    // One time set up view
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: OnboardingView),
    CupertinoRoute(page: DormSelectionView),

    // Home
    CupertinoRoute(page: HomeView),

    // Delivery
    CupertinoRoute(page: RequestDeliveryView),
    CupertinoRoute(page: MyPackagesView),
    CupertinoRoute(page: CurrentTasksView),

    // Maps
    CupertinoRoute(page: DeliverForOthersView),
    CupertinoRoute(page: LocationView),

    // Marketplace
    CupertinoRoute(page: MarketPlaceView),
  ],

  // Auto generate app.locator.dart
  dependencies: [
    // Database
    LazySingleton(classType: FirestoreApi),
    LazySingleton(classType: FirebaseDatabaseApi),

    // App-related
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PageControllerService),
    LazySingleton(classType: DialogService),

    // Models
    LazySingleton(classType: UserService),
    LazySingleton(classType: DeliveryService),

    // Location-based
    LazySingleton(classType: LocationTrackingService),
    LazySingleton(classType: GoogleMapService),
    LazySingleton(classType: PackageTrackingService),
    Singleton(classType: FirebaseAuthenticationService),
  ],

  // Auto generate app.logger.dart
  logger: StackedLogger(),
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
