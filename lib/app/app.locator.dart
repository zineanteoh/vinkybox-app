// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../api/firebase_database_api.dart';
import '../api/firestore_api.dart';
import '../services/delivery_service.dart';
import '../services/firebase_authentication_service.dart';
import '../services/google_map_service.dart';
import '../services/location_tracking_service.dart';
import '../services/package_tracking_service.dart';
import '../services/page_controller_service.dart';
import '../services/user_service.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => FirestoreApi());
  locator.registerLazySingleton(() => FirebaseDatabaseApi());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => PageControllerService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => DeliveryService());
  locator.registerLazySingleton(() => LocationTrackingService());
  locator.registerLazySingleton(() => GoogleMapService());
  locator.registerLazySingleton(() => PackageTrackingService());
  locator.registerSingleton(FirebaseAuthenticationService());
}
