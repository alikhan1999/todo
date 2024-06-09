import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stack_trace/stack_trace.dart';
import 'package:todo/constant/style.dart';
import 'package:todo/services/notificationService/i_notification_service.dart';

class NotificationService implements INotificationService {
  FirebaseMessaging? _messaging;

  NotificationService() {
    _messaging = FirebaseMessaging.instance;
  }
  @override
  void foregroundFcmHandler(BuildContext context) {
    d("Adding FOREGROUND HANDLER");
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        d("foreground listner");
        RemoteNotification? notification = message.notification;
        if (notification != null) {
          d(notification.title!);
          d(notification.body!);
          d(message.data);
          Flushbar(
            margin: const EdgeInsets.all(12),
            borderRadius: BorderRadius.circular(8),
            borderColor: Style.scaffoldBackground.withOpacity(0.5),
            flushbarStyle: FlushbarStyle.FLOATING,
            onTap: (value) {
              // Navigator.push(navigatorKey.currentState!.context, MaterialPageRoute(builder: (_) => const NotificationList()));
            },
            titleText: Text(
              message.notification!.title ?? '',
              // textDirection: TextDirection.rtl,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14.0,
                color: Style.blueColor,
                fontWeight: FontWeight.w600,
                fontFamily: "navigoBlack",
              ),
            ),
            duration: const Duration(seconds: 3000),
            flushbarPosition: FlushbarPosition.TOP,
            // textDirection: TextDirection.rtl,
            animationDuration: const Duration(milliseconds: 650),
            backgroundColor: Style.scaffoldBackground,
            messageText: Text(
              message.notification!.body ?? '',
              // textDirection: TextDirection.rtl,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12.0,
                color: Style.blueColor,
                fontFamily: "navigoBlack",
              ),
            ),
          ).show(context) as Flushbar;
          d(message.notification!.title!);
          d('This is the hello::::: ');
        }
      },
    );
  }

  @override
  Future<void> requestFcmPermission() async {
    try {
      await _messaging?.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      await _messaging?.setForegroundNotificationPresentationOptions(
        sound: true,
      );
    } catch (e) {
      d(e);
      rethrow;
    }
  }

  @override
  Future<void> fcmInteracted() async {
    d("IN fcmInteracted");
    RemoteMessage? initialMessage = await _messaging?.getInitialMessage();
    d("initialMessageinitialMessageinitialMessage :: $initialMessage");
    if (initialMessage != null) {
      d("KILLED STATE FCM TAPPED");
      Future.delayed(const Duration(seconds: 8), () {
        handleNotificationInteraction(initialMessage);
      });
    }
    FirebaseMessaging.onMessageOpenedApp.listen((data) {
      d("BACKGROUND FCM TAPPED");
      handleNotificationInteraction(data);
    });
  }

  handleNotificationInteraction(RemoteMessage message, {bool doNav = true}) async {}

  @override
  Future<void> sendPushMessage(String body, String title, String token) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA3snEXSc:APA91bE7DnTzUbkFpqe5scnqIhTV7NZ7LeO_0q2T-ey9zcCkwMdctMpQPMfpsnG7SYlW6g27FrtDMbfUqocj_8IHiJDLrkpcjxtd95xNowwb0dp9xf9mZCwxjHVrXUhX4I7h1oEGvqZ9',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{'click_action': 'FLUTTER_NOTIFICATION_CLICK', 'id': '1', 'status': 'done'},
            "to": token,
          },
        ),
      );
    } catch (e) {
      d(e);
    }
  }
}

void d(Object object) {
  var output = "${Trace.current().frames[1].location} | $object";

  final pattern = RegExp('.{1,1000}'); // 1000 is the size of each chunk
  pattern.allMatches(output).forEach((match) => debugPrint(match.group(0)));
}
