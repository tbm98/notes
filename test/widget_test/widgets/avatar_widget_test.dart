import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes/src/ui/dialogs/profile.dart';
import 'package:notes/src/ui/screens/home/providers/profile_providers.dart';
import 'package:notes/src/ui/screens/memories/providers.dart';
import 'package:notes/src/ui/screens/todo/providers.dart';
import 'package:notes/src/ui/widgets/avatar_widget.dart';

import '../config_vars.dart';
import '../utils.dart';

void main() {
  setupGetItTest();
  testWidgets('test avatar_widget guest', (tester) async {
    //setup
    when(mockAuth.signIn()).thenAnswer((_) => Future.value(userSignedIn));

    await tester.pumpWidget(ProviderScope(overrides: [
      profileProvider
          .overrideWithValue(ProfileNotifier(user: userGuest, auth: mockAuth)),
      unfinishedTodoProvider.overrideWithValue([]),
      memoriesNoteProvider.overrideWithValue([])
    ], child: testApp(child: const AvatarWidget())));

    await tester.pumpAndSettle();

    expect(find.byType(GuestAvatar), findsOneWidget);
    expect(find.byType(SignedInAvatar), findsNothing);

    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    verify(mockAuth.signIn());
  });

  testWidgets('test avatar_widget signedin', (tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      profileProvider.overrideWithValue(
          ProfileNotifier(user: userSignedIn, auth: mockAuth)),
      unfinishedTodoProvider.overrideWithValue([]),
      memoriesNoteProvider.overrideWithValue([])
    ], child: testApp(child: const AvatarWidget())));

    await tester.pumpAndSettle();

    expect(find.byType(SignedInAvatar), findsOneWidget);
    expect(find.byType(GuestAvatar), findsNothing);

    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    expect(find.byType(ProfileDialog), findsOneWidget);
  });
}
