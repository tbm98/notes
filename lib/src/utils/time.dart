import 'package:flutter/material.dart';
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
