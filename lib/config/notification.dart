import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationsManager {
  PushNotificationsManager._privateConstructor();
  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._privateConstructor();

  final firebaseMessaging = FirebaseMessaging.instance;

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
    const initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher_foreground');
    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    if (!_initialized) {
      try {
        await firebaseMessaging.requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
      } catch (e) {
        debugPrint(e.toString());
      }

      // when app is opened via a notification whilst the app is terminated
      final initialMessage = await firebaseMessaging.getInitialMessage();
      if (initialMessage != null && context.mounted) {
        onSelectNotification(context);
      }

      FirebaseMessaging.onBackgroundMessage(
          (message) => onSelectNotification(context));

      // when user presses a notification message displayed via FCM.
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        onSelectNotification(context);
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        showNotification(
          message.notification?.title ?? 'New notification',
          message.notification?.body ?? 'You have a new notification',
          '${message.data['id']}',
        );
      });

      _initialized = true;
    }
  }
}

@pragma('vm:entry-point')
Future<void> showNotification(String title, String body, String id) async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'default',
    'new_request',
    importance: Importance.high,
    playSound: true,
    showProgress: true,
    priority: Priority.high,
    enableLights: true,
    enableVibration: true,
    // sound: RawResourceAndroidNotificationSound('notification.caf'),
  );

  const iOSChannelSpecifics = DarwinNotificationDetails(
    presentSound: true,
    // sound: 'notification.caf',
  );

  const platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platformChannelSpecifics,
    payload: 'home',
  );
}

Future onSelectNotification(BuildContext context) async {
  Navigator.pushNamedAndRemoveUntil(
    context,
    AppRoutes.init,
    (route) => false,
  );
}
