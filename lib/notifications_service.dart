import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:travelseller/components/custom/icons.dart';
//import 'package:flutter_native_timezone/flutter_native_timezone.dart';
//import 'package:timezone/timezone.dart' as tz;
//import 'package:timezone/data/latest_all.dart' as tz;
import 'package:travelseller/pages/principais/home.dart';

class CustomNotification {
  final int id;
  final String? title;
  final String? body;

  CustomNotification(
      {required this.id, required this.title, required this.body});
}

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late NotificationDetails platformChannelSpecifics;

  initializeNotifications(BuildContext context) async {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const android = AndroidInitializationSettings(CustomIcons.notification);
    const ios = DarwinInitializationSettings();

    await localNotificationsPlugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
      onDidReceiveBackgroundNotificationResponse: onSelectNotification(context),
    );

    const androidDetails = AndroidNotificationDetails(
      'viagem_notification',
      'Viagem',
      importance: Importance.max,
      priority: Priority.high,
      enableVibration: true,
    );

    //const IOSFlutterLocalNotificationsPlugin iosDetails;

    platformChannelSpecifics =
        const NotificationDetails(android: androidDetails);
  }

  showNotification(
      CustomNotification notification, BuildContext context) async {
    await initializeNotifications(context);

    await localNotificationsPlugin.show(notification.id, notification.title,
        notification.body, platformChannelSpecifics);
  }

  onSelectNotification(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => const Home(
                  currentIndex: 1,
                ))));
  }

  checkForNotifications(BuildContext context) async {
    final details =
        await localNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onSelectNotification(context);
    }
  }
}
