import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/constants/app_keys.dart';
import 'package:vinkybox/ui/views/location/temp_home_view.dart';
import 'package:vinkybox/ui/views/startup/startup_view.dart';
import 'dart:io' show Platform;

// firebase emulators:start --import=exported-dev-data --export-on-exit=exported-dev-data
const bool USE_EMULATOR = true;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (USE_EMULATOR) {
    await _connectToFirestoreEmulator();
  }

  setupLocator();
  runApp(const MyApp());
}

Future _connectToFirestoreEmulator() async {
  final localHostString =
      Platform.isAndroid ? '10.0.2.2' : 'localhost';

  FirebaseFirestore.instance.settings = Settings(
    host: '$localHostString:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );

  FirebaseDatabase.instance
      .useDatabaseEmulator(localHostString, 9000);

  FirebaseFirestore.instance
      .useFirestoreEmulator(localHostString, 8080);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'VinkyBox',
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        // home: const StartUpView(),
        home: const TempHomeView(),
        debugShowCheckedModeBanner: false);
  }
}
