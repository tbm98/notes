import 'package:get_it/get_it.dart';
import 'package:notes/src/core/storage/firestore_storage.dart';
import 'package:notes/src/core/storage/storage.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<Storage>(() => FirestoreStorage());
}
