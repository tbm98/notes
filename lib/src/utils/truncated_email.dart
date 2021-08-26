String truncatedEmail(String email) {
  final emailName = email.split('@')[0];
  int visibleLength = emailName.length ~/ 3;
  String visibleName = emailName.substring(0, visibleLength);
  return '$visibleName${'*' * (email.length - visibleLength)}';
}
