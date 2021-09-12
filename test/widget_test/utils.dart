import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/src/core/auth/auth.dart';
import 'package:notes/src/core/notifications/notifications.dart';
import 'package:notes/src/core/share/share_handler.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/di/get_it.dart';

import 'config_vars.dart';

void setupGetItTest() {
  getIt.registerLazySingleton<Auth>(() => mockAuth);
  getIt.registerLazySingleton<Storage>(() => mockStorage);
  getIt.registerLazySingleton<Notifications>(() => mockNotifications);
  getIt.registerFactory<ShareHandler>(() => mockShareHandler);
}

Widget testApp({required Widget child}) {
  return MaterialApp(home: Material(child: child));
}
