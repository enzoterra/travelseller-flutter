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
  late AndroidNotificationDetails androidDetails;
  //late IOSFlutterLocalNotificationsPlugin iosDetails;
  late BuildContext context;

  NotificationService(BuildContext context) {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotifications(context);
  }

  _setupNotifications(BuildContext context) async {
   // await _setupTimezone();
    await _initializeNotifications(context);
  }

  /*Future<void> _setupTimezone() async {
    tz.initializeTimeZones();
    final String timezoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timezoneName));
  }*/

  _initializeNotifications(BuildContext context) async {
    const android = AndroidInitializationSettings(CustomIcons.notification);
    const ios = DarwinInitializationSettings();

    await localNotificationsPlugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
      onDidReceiveBackgroundNotificationResponse:
          _onSelectNotification(context),
    );
  }

  _onSelectNotification(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => const Home(
                  currentIndex: 1,
                ))));
  }

  showNotification(CustomNotification notification) {
    androidDetails = const AndroidNotificationDetails(
      'viagem_notification',
      'Viagem',
      importance: Importance.max,
      priority: Priority.high,
      enableVibration: true,
    );

    localNotificationsPlugin.show(notification.id, notification.title,
        notification.body, NotificationDetails(android: androidDetails));
  }

  checkForNotifications(BuildContext context) async {
    final details =
        await localNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      _onSelectNotification(context);
    }
  }
}
