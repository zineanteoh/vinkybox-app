// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/delivery/latest_requests/latest_requests_view.dart';
import '../ui/views/delivery/my_packages/my_packages_view.dart';
import '../ui/views/delivery/request_delivery/request_delivery_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/location/location_view.dart';
import '../ui/views/location/temp_home_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/marketplace/marketplace_view.dart';
import '../ui/views/onboarding/dorm_selection/dorm_selection_view.dart';
import '../ui/views/onboarding/onboarding_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String loginView = '/login-view';
  static const String onboardingView = '/onboarding-view';
  static const String dormSelectionView = '/dorm-selection-view';
  static const String homeView = '/home-view';
  static const String requestDeliveryView = '/request-delivery-view';
  static const String myPackagesView = '/my-packages-view';
  static const String latestRequestsView = '/latest-requests-view';
  static const String tempHomeView = '/temp-home-view';
  static const String locationView = '/location-view';
  static const String marketPlaceView = '/market-place-view';
  static const all = <String>{
    startUpView,
    loginView,
    onboardingView,
    dormSelectionView,
    homeView,
    requestDeliveryView,
    myPackagesView,
    latestRequestsView,
    tempHomeView,
    locationView,
    marketPlaceView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.dormSelectionView, page: DormSelectionView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.requestDeliveryView, page: RequestDeliveryView),
    RouteDef(Routes.myPackagesView, page: MyPackagesView),
    RouteDef(Routes.latestRequestsView, page: LatestRequestsView),
    RouteDef(Routes.tempHomeView, page: TempHomeView),
    RouteDef(Routes.locationView, page: LocationView),
    RouteDef(Routes.marketPlaceView, page: MarketPlaceView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    OnboardingView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const OnboardingView(),
        settings: data,
      );
    },
    DormSelectionView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const DormSelectionView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    RequestDeliveryView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const RequestDeliveryView(),
        settings: data,
      );
    },
    MyPackagesView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MyPackagesView(),
        settings: data,
      );
    },
    LatestRequestsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const LatestRequestsView(),
        settings: data,
      );
    },
    TempHomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const TempHomeView(),
        settings: data,
      );
    },
    LocationView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const LocationView(),
        settings: data,
      );
    },
    MarketPlaceView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MarketPlaceView(),
        settings: data,
      );
    },
  };
}
