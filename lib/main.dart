import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_with_notification/firebase_options.dart';
import 'package:get/get.dart';

import 'Routes/routes.dart';

Future<void> _fireHandler(RemoteMessage message) async {
  debugPrint(" 🧧🧧🧧 Hitting _firehandler 🧧🧧🧧");
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint(
      '🧧🧧🧧 Handling a background message: ${message.messageId} 🧧🧧🧧');

  if (message.notification != null) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        channelKey: message.notification!.android!.channelId ?? "basic",
        id: Random().nextInt(2147483647),
        body: message.notification!.body,
        title: message.notification!.title,
        bigPicture: message.notification!.android?.imageUrl ?? "",
        largeIcon: "resource://drawable/push_two",
        notificationLayout: message.notification!.android?.imageUrl != null
            ? NotificationLayout.BigPicture
            : NotificationLayout.BigText,
        autoDismissible: true,
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_fireHandler);
  await FirebaseMessaging.instance.subscribeToTopic('all');
  AwesomeNotifications().initialize(
    'resource://drawable/ic_launcher',
    [
      NotificationChannel(
        channelKey: 'key1',
        channelName: 'Basic Chnl',
        channelDescription: 'Basic Testing',
        enableLights: true,
        enableVibration: true,
      )
    ],
  );
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Demo app",
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      initialRoute: Routes.myHomePage,
      getPages: Routes.list,
    );
  }
}
