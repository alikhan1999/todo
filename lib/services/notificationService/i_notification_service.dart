import 'package:flutter/material.dart';

abstract class INotificationService {
  Future<void> requestFcmPermission();
  Future<void> fcmInteracted();
  void foregroundFcmHandler(BuildContext context);
  Future<void> sendPushMessage(String body, String title, String token);
}
