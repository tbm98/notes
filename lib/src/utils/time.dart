import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/src/config/global_constant.dart';

Future<DateTime?> showDateTimePicker(BuildContext context) async {
  final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDatePicker,
      lastDate: lastDatePicker);
  if (date == null) {
    return null;
  }
  final time =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());
  if (time == null) {
    return date;
  }
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}

String formatDate(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  final date = formatDateWithoutTime(dateTime);
  final time = DateFormat('HH:mm').format(dateTime);
  return '$date $time';
}

String formatDateWithoutTime(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }

  final now = DateTime.now();
  final initToday =
      DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
  final initYesterday = initToday - aDayMillis;
  if (dateTime.millisecondsSinceEpoch >= initToday &&
      dateTime.millisecondsSinceEpoch <= initToday + aDayMillis) {
    return 'Today';
  }
  if (dateTime.millisecondsSinceEpoch >= initYesterday &&
      dateTime.millisecondsSinceEpoch <= initYesterday + aDayMillis) {
    return 'Yesterday';
  }
  return DateFormat('dd/MM/yyyy').format(dateTime);
}
