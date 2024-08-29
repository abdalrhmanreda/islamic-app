import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    AwesomeNotifications().initialize(
      // Use 'resource://drawable/res_app_icon' if your app icon is in the drawable folder
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'Scheduled Notifications',
          channelDescription: 'Notifications sent on a schedule',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          locked: true,
        ),
      ],
      debug: true,
    );
  }

  Future<void> requestPermissions() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  Future<void> scheduleRepeatingNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10, // Unique ID for each notification
        channelKey: 'scheduled_channel',
        title: 'Scheduled Notification',
        body: 'This notification repeats every 15 minutes.',
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationInterval(
        interval: 15 * 60, // 15 minutes in seconds
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        repeats: true,
      ),
    );
  }

  Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

}
