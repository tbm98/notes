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
  test('test now time', () {
    expect(formatDateWithoutTime(DateTime.now()), 'Today');
  });
  test('test today time', () {
    final now = DateTime.now();
    final initToday = DateTime(now.year, now.month, now.day);
    final endToday = DateTime(now.year, now.month, now.day, 23, 59);
    expect(formatDateWithoutTime(initToday), 'Today');
    expect(formatDateWithoutTime(endToday), 'Today');
  });
  test('test yesterday', () {
    final now = DateTime.now();
    final initYesterday = DateTime(now.year, now.month, now.day)
        .subtract(const Duration(days: 1));
    final endYesterday = DateTime(
        initYesterday.year, initYesterday.month, initYesterday.day, 23, 59);
    expect(formatDateWithoutTime(initYesterday), 'Yesterday');
    expect(formatDateWithoutTime(endYesterday), 'Yesterday');
  });
}
