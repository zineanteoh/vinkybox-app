import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  final String id;
  final String fullName;
  final String email;
  final String dorm;

  AppUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.dorm,
  });

  AppUser.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        dorm = data['dorm'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'dorm': dorm,
    };
  }

  // AppUser convertFirebaseUserToAppUser(User user) {
  //   return AppUser(
  //     id: user.uid,
  //     fullName:
  //     email: user.email!,
  //   );
  // }
}
