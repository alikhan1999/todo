import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/application/app.dart';
import 'package:todo/application/main_config/main_config.dart' as config;
import 'package:todo/common/logger/log.dart';
import 'package:todo/firebase_options.dart';

/// Used for Background Updates using Workmanager Plugin
typedef SetRegisteredRoutes = Route<dynamic> Function(RouteSettings settings);
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // await Firebase.initializeApp();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await config.initMainServiceLocator();

    // const routes = RouteGenerator.generateRoute;
    runApp(todo());
  }, (error, stackTrace) async {
    d('ZonedGuardedError:  ${error.toString()} $stackTrace');
  });
}
