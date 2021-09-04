import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/home/providers/profile_providers.dart';

class GuestPage extends ConsumerWidget {
  const GuestPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Notes',
              style: TextStyle(
                fontSize: 72,
                color: Theme.of(context).primaryColor,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                ref.read(profileProvider.notifier).signIn();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
