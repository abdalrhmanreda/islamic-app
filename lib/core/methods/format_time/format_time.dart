import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTime(TimeOfDay timeOfDay) {
  DateTime now = DateTime.now();
  DateTime dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);

  String formattedTime = DateFormat.jm().format(dateTime);
  return formattedTime;
}

String formatDate(DateTime date) {
  return DateFormat('dd MMM').format(date);
}
