import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/home/providers/profile_providers.dart';
import 'package:notes/src/ui/screens/trash/providers.dart';

Future<bool> showConfirmEmptyTrashDialog(BuildContext context) async {
  final _textEditController = TextEditingController();
  final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm prompt'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                  'Empty trash will delete notes in trash and can\'t undo'),
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
                      if (_textEditController.text == email) {
                        final emptyResult =
                            await ref.read(trashProvider.notifier).emptyTrash();
                        Navigator.pop(context, emptyResult);
                      } else {
                        Navigator.pop(context, false);
                      }
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(color: Theme.of(context).canvasColor),
                    ));
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
