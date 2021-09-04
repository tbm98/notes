import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/home/providers/profile_providers.dart';

Future<bool> showVerifyAccount(
  BuildContext context, {
  required String message,
}) async {
  final _textEditController = TextEditingController();
  final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm prompt'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              TextField(
                controller: _textEditController,
                decoration: const InputDecoration(
                    hintText: 'ex: abc@gmail.com',
                    labelText: 'Enter current user\'s email to confirm'),
              )
            ],
          ),
          actions: [
            Consumer(
              builder: (context, ref, _) {
                return OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red.shade400),
                  onPressed: () async {
                    final email = ref.read(profileProvider).map(
                        signedIn: (value) => value.email, guest: (_) => null);

                    Navigator.pop(context, _textEditController.text == email);
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Theme.of(context).canvasColor),
                  ),
                );
              },
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Cancel'))
          ],
        );
      });

  return result ?? false;
}
