import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/global_constant.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/compose/compose_page.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';

class ComposeButton extends ConsumerWidget {
  const ComposeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OpenContainer<NoteModel>(
      openBuilder: (
        BuildContext context,
        void Function({NoteModel? returnValue}) action,
      ) {
        return ComposePage(returnValueCallback: action);
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
        await ref.read(allNoteProvider.notifier).addNote(returnValue);
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
