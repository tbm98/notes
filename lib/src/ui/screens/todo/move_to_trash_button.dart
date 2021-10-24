import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';

class MoveToTrashButton extends ConsumerWidget {
  const MoveToTrashButton({
    Key? key,
    required this.noteModel,
  }) : super(key: key);
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () async {
          final scaffoldMessager = ScaffoldMessenger.of(context);
          final allNoteNotifier = ref.read(allNoteProvider.notifier);
          await allNoteNotifier
              .updateNote(noteModel.copyWith(movedToTrash: true));
          scaffoldMessager.showSnackBar(SnackBar(
            content:
                Text('Moved ${Characters(noteModel.title).take(10)} to trash'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                allNoteNotifier
                    .updateNote(noteModel.copyWith(movedToTrash: false));
              },
            ),
          ));
        },
        icon: const Icon(CupertinoIcons.trash));
  }
}
