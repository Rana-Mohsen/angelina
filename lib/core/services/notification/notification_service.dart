import 'package:angelina/constants.dart';
import 'package:angelina/views/favourite/favorite_view.dart';
import 'package:angelina/views/home/more_products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    final InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (context) => MoreProductsView()),
          );
        }
      },
    );
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          importance: Importance.high,
          priority: Priority.high,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: 'moreView',
    );
  }
}
