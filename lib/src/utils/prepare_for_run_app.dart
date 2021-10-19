import 'package:notes/src/di/get_it.dart';

Future<void> prepareForRunApp() async {
  setupGetIt();
}

Future<void> prepareForRunAppFake() async {
  setupGetItFake();
}
