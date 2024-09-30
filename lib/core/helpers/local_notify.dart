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
      'resource://mipmap/ic_launcher',
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

  Future<void> scheduleRepeatingNotification({required String body}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        // Unique ID for each notification
        channelKey: 'scheduled_channel',
        title: 'وَذَكِّرْ فَإِنَّ الذِّكْرَىٰ تَنفَعُ الْمُؤْمِنِينَ',
        body: body,
        notificationLayout: NotificationLayout.Default,
        displayOnBackground: true,
        displayOnForeground: true,
      ),
      schedule: NotificationInterval(
        interval: 15 * 60, // 15 minutes in seconds
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        repeats: true,
      ),
    );
  }

  Future<void> sendNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        // Ensure this ID is unique if used for multiple notifications
        channelKey: 'scheduled_channel',
        title: 'Hello',
        body: 'This is a simple notification',
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
