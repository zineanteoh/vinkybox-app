import 'package:vinkybox/app/app.logger.dart';

// Assumes email is in the form of
// e.g. firstname.middle.lastname@domain.com
String getNameFromEmail(String email) {
  final log = getLogger('EmailExtensions');
  try {
    var names = email.split('@')[0].split('.');
    // e.g. name: 'firstname.middle.lastname' or 'firstname.lastname'
    String firstName = names[0];
    // String lastName = names[names.length - 1];
    return capitalize(firstName); // + " " + capitalize(lastName);
  } catch (e) {
    log.e(e);
    return "";
  }
}

String capitalize(String word) {
  return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
}
