import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinkybox/app/app.logger.dart';

class FirebaseAuthenticationService {
  final log = getLogger('FirebaseAuthenticationService');

  FirebaseAuth auth = FirebaseAuth.instance;

  AuthCredential? _pendingCredential;
}
