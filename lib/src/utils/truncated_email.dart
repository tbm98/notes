//TODO: docs
String truncatedEmail(String email) {
  final emailName = email.split('@')[0];

  if (emailName.length <= 3) {
    return '*' * email.length;
  }

  int visibleLength = emailName.length ~/ 3;
  int invisibleLength = email.length - visibleLength;

  String visibleName = emailName.substring(0, visibleLength);

  return '$visibleName${'*' * invisibleLength}';
}
