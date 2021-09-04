import 'package:flutter_test/flutter_test.dart';
import 'package:notes/src/utils/truncated_email.dart';

void main() {
  test('test truncatedEmail', () {
    final emails = [
      'abcd@gmail.com',
      'abc@gmail.com',
      'tbm98.dev@gmail.com',
      'a@gmail.com'
    ];
    final results = [
      'a*************',
      '*************',
      'tbm****************',
      '***********'
    ];
    for (int i = 0; i < emails.length; ++i) {
      expect(truncatedEmail(emails[i]), results[i]);
    }
  });
}
