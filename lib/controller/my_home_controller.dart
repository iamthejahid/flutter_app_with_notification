import 'dart:math';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class MyHomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // For android 12, noification permission is required.
    // So we are pursuing the notification.
    _checkUpNotificationPermission();

    // when app is running mode, we will listen, if there is any message.

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // If there is any message, it will create a notification using _notifyUser.
      _notifyUser(message);
    });
  }

  _checkUpNotificationPermission() async {
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  _notifyUser(RemoteMessage msg) {
    // ignore: avoid_print
    print(
        " 🧧🧧🧧  ***********Notification perfectly firing*********** 🧧🧧🧧 ");
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        channelKey: msg.notification!.android!.channelId ?? "basic",
        id: Random().nextInt(2147483647),
        body: msg.notification!.body,
        title: msg.notification!.title,
        bigPicture: msg.notification!.android?.imageUrl ?? "",
        largeIcon: "resource://drawable/push_two",
        notificationLayout: msg.notification!.android?.imageUrl != null
            ? NotificationLayout.BigPicture
            : NotificationLayout.BigText,
        autoDismissible: true,
      ),
    );

    // If you want to redirect to any page , like notifation page or any other kind, you can do it from here.
  }

  var counter = 0.obs;

  increment() {
    counter++;
  }

  decrement() {
    counter--;
  }
}
