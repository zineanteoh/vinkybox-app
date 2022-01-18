import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

enum PackageSize { None, Small, Medium, Large, Other }

const List<String> requestPackageSize = [
  "Small",
  "Medium",
  "Large",
  "Other",
];

const List<IconData> packageSizeIcon = [
  CarbonIcons.box,
  CarbonIcons.box,
  CarbonIcons.box,
];

const List<String> requestPickUpLocation = [
  "Lockerbank",
  "Counter",
];

// Note: This list is likely to be user-customizable. Dummy strings for now
const List<String> requestDropOffLocation = [
  "My dorm",
];

const List<String> requestTime = [
  "Anytime",
  "11 - 12PM",
  "12 - 1PM",
  "1 - 2PM",
  "2 - 3PM",
  "3 - 4PM",
];

const List<String> deliveryStatus = [
  "new",
  "collecting", // package is being collected
  "delivering",
  "delivered"
];
