import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/global_constant.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/compose_notes/compose_note_page.dart';
import 'package:notes/src/ui/screens/compose_notes/providers.dart';

class AddNoteButton extends ConsumerWidget {
  const AddNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OpenContainer<NoteModel>(
      openBuilder: (
        BuildContext context,
        void Function({NoteModel? returnValue}) action,
      ) {
        return AddNotePage(returnValueCallback: action);
      },
      closedElevation: 6.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(fabDimension / 2)),
      ),
      closedColor: Theme.of(context).colorScheme.secondary,
      closedBuilder: (
        BuildContext context,
        void Function() action,
      ) {
        return FloatingActionButton(
          onPressed: action,
          child: const Icon(Icons.edit),
        );
      },
      onClosed: (returnValue) async {
        if (returnValue == null) {
          return;
        }
        await ref.read(composeNoteProvider.notifier).saveNote(returnValue);
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
