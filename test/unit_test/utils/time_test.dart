import 'package:flutter_test/flutter_test.dart';
import 'package:notes/src/utils/time.dart';

void main() {
  test('test formatDate null', () {
    expect(formatDate(null), '');
  });
  test(
      'test formatDate not null',
      () => () {
            final date = DateTime(2020, 1, 21, 1, 51);
            expect(formatDate(date), '21/01/2020 01:51');
          });

  test('test formatDateWithoutTime null', () {
    expect(formatDateWithoutTime(null), '');
  });
  test(
      'test formatDateWithoutTime not null',
      () => () {
            final date = DateTime(2020, 1, 21, 1, 51);
            expect(formatDateWithoutTime(date), '21/01/2020');
          });
}
