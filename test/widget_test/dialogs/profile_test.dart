import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes/src/config/naming.dart';
import 'package:notes/src/ui/dialogs/profile.dart';
import 'package:notes/src/ui/screens/home/providers/profile_providers.dart';
import 'package:notes/src/ui/screens/memories/providers.dart';
import 'package:notes/src/ui/screens/todo/providers.dart';
import 'package:notes/src/utils/truncated_email.dart';

import '../config_vars.dart';
import '../utils.dart';

void main() {
  setupGetItTest();

  testWidgets('test ProfileDialog', (tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      profileProvider.overrideWithValue(
          ProfileNotifier(user: userSignedIn, auth: mockAuth)),
      unfinishedTodoProvider.overrideWithValue([]),
      memoriesNoteProvider.overrideWithValue([])
    ], child: testApp(child: const ProfileDialog())));

    expect(find.byType(ProfileDialog), findsOneWidget);
    expect(find.text(userSignedIn.displayName!), findsOneWidget);
    expect(find.text(truncatedEmail(userSignedIn.email!)), findsOneWidget);

    expect(find.text('0'), findsNWidgets(2)); // two widgets count note

    expect(find.text(deleteAccount), findsOneWidget);
    expect(find.text(switchAccount), findsOneWidget);
  });

  testWidgets('test ProfileDialog switch account', (tester) async {
    // setup dependencies
    when(mockAuth.currentUser).thenReturn(userGuest);

    await tester.pumpWidget(ProviderScope(overrides: [
      profileProvider.overrideWithValue(
          ProfileNotifier(user: userSignedIn, auth: mockAuth)),
      unfinishedTodoProvider.overrideWithValue([]),
      memoriesNoteProvider.overrideWithValue([])
    ], child: testApp(child: const ProfileDialog())));

    await tester.tap(find.text(switchAccount));
    verify(mockAuth.signOut());
    verify(mockNotifications.cancelAllNotifications());
  });

  testWidgets('test ProfileDialog delete account', (tester) async {
    // setup dependencies
    when(mockAuth.currentUser).thenReturn(userGuest);
    when(mockStorage.deleteAccount()).thenAnswer((_) => Future.value(true));

    await tester.pumpWidget(ProviderScope(overrides: [
      profileProvider.overrideWithValue(
          ProfileNotifier(user: userSignedIn, auth: mockAuth)),
      unfinishedTodoProvider.overrideWithValue([]),
      memoriesNoteProvider.overrideWithValue([])
    ], child: testApp(child: const ProfileDialog())));

    await tester.tap(find.text(deleteAccount));
    await tester.pumpAndSettle();

    expect(find.text('Confirm prompt'), findsOneWidget);
    await tester.enterText(find.byType(TextField), userSignedIn.email!);
    expect(find.text(userSignedIn.email!), findsOneWidget);
    await tester.tap(find.text('Ok'));

    verify(mockStorage.deleteAccount());
    verify(mockAuth.signOut());
    verify(mockNotifications.cancelAllNotifications());
  });
}
