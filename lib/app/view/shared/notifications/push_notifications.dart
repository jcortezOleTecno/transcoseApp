import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vemare/app/view/my_notifications/my_notifications_page.dart';
import 'package:vemare/main.dart';

import 'notifications_util.dart';

String? tokenFirebase;

@pragma('vm:entry-point')
void onDidReceiveBackgroundNotificationResponse(
    NotificationResponse response) {}

class PushNotificationsProvider {
  static final PushNotificationsProvider _instance =
      PushNotificationsProvider._internal();

  factory PushNotificationsProvider() => _instance;

  PushNotificationsProvider._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  void initNotifications() {
    NotificationUtils.setupNotificationPlugin(
      onDidReceiveLocalNotification: (id, title, body, payload) {
        log("onDidReceiveLocalNotification");
      },
      onDidReceiveNotificationResponse: (p0) {
        log('onDidReceiveNotificationResponse');

        navigatorKey.currentState!.pushNamed(MyNotificationsPage.route);
      },
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );

    _initFirebaseMessage();
  }

  void _initFirebaseMessage() {
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);

    //Notificacion en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('onMessage');
      print(message.data);
      showNotification(message);
    });

    // Click a la notificacion en segundo plano.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('onMessageOpenedApp');
      navigatorKey.currentState!.pushNamed(MyNotificationsPage.route);
    });

    _messaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      provisional: true,
    );

    _messaging.getToken().then((token) {
      assert(token != null);
      log(token.toString());
      tokenFirebase = token;
    });
  }

  static Future<dynamic> _onBackgroundMessage(RemoteMessage message) async {
    log("onBackgroundMessage");
  }

  static void showNotification(
    RemoteMessage message,
  ) async {
    var data = Map<String, dynamic>.from(
      message.data['data'] ?? message.data,
    );
    log(data.toString());
    NotificationUtils.showNotification(
      id: data['idNotification'].hashCode,
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: json.encode({
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        ...data,
      }),
    );
  }
}
