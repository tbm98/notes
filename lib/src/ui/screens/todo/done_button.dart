import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';

class DoneButton extends ConsumerWidget {
  const DoneButton({
    Key? key,
    required this.noteModel,
  }) : super(key: key);
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
        onPressed: () async {
          final allNoteNotifier = ref.read(allNoteProvider.notifier);
          allNoteNotifier.updateNote(noteModel.copyWith(finished: true));

          final scaffoldMessager = ScaffoldMessenger.of(context);
          scaffoldMessager.showSnackBar(SnackBar(
            duration: const Duration(minutes: 1),
            content: Text('Done "${Characters(noteModel.title).take(10)}"'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                allNoteNotifier.updateNote(noteModel.copyWith(finished: false));
              },
            ),
          ));
        },
        child: const Text('Done'));
  }
}
