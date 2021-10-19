import 'package:get_it/get_it.dart';
import 'package:notes/src/core/auth/auth.dart';
import 'package:notes/src/core/auth/fake_auth.dart';
import 'package:notes/src/core/auth/google_auth.dart';
import 'package:notes/src/core/notifications/local_notifications.dart';
import 'package:notes/src/core/notifications/notifications.dart';
import 'package:notes/src/core/share/share_handler.dart';
import 'package:notes/src/core/share/share_handler_default.dart';
import 'package:notes/src/core/storage/fake_storage.dart';
import 'package:notes/src/core/storage/firestore_storage.dart';
import 'package:notes/src/core/storage/storage.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<Auth>(() => GoogleAuth());
  getIt.registerLazySingleton<Storage>(
      () => FirestoreStorage(auth: getIt<Auth>()));
  getIt.registerLazySingleton<Notifications>(() => LocalNotifications());
  getIt.registerFactory<ShareHandler>(() => ShareHandlerDefault());
}

void setupGetItFake(){
  getIt.registerLazySingleton<Auth>(() => FakeAuth());
  getIt.registerLazySingleton<Storage>(
          () => FakeStorage());
  getIt.registerLazySingleton<Notifications>(() => LocalNotifications());
  getIt.registerFactory<ShareHandler>(() => ShareHandlerDefault());
}
