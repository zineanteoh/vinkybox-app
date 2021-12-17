import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

// Run the following to regenerate application_models files:
// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class User with _$User {
  User._();

  factory User(
      {required String id,
      String? fullName,
      String? email,
      String? dorm}) = _User;

  // final String id;
  // final String fullName;
  // final String email;
  // final String dorm;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  // Map<String, dynamic> toJson() => _$UserToJson(this);
}
