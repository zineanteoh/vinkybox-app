import 'package:cloud_firestore/cloud_firestore.dart';

// Temporary model for PackageRequest
class RequestItem {
  final String status;

  RequestItem({required this.status});

  RequestItem.fromSnapshot(DocumentSnapshot snapshot)
      : status = snapshot['status'] ?? "nothing yet";
}
