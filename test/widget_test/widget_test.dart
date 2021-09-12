// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:notes/main.dart';
import 'package:notes/src/core/auth/auth.dart';
import 'package:notes/src/core/notifications/notifications.dart';
import 'package:notes/src/core/share/share_handler.dart';
import 'package:notes/src/core/storage/storage.dart';

@GenerateMocks([Auth, Storage, Notifications, ShareHandler])
void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: App()));
  });
}
