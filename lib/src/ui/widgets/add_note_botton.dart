import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/global_constant.dart';
import 'package:notes/src/ui/screens/add_note/add_note_page.dart';

class AddNoteButton extends ConsumerWidget {
  const AddNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OpenContainer(
      openBuilder:
          (BuildContext context, void Function({Object? returnValue}) action) {
        return const AddNotePage();
      },
      closedElevation: 6.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(fabDimension / 2)),
      ),
      closedColor: Theme.of(context).colorScheme.secondary,
      closedBuilder: (BuildContext context, void Function() action) {
        return FloatingActionButton(
          onPressed: action,
          child: const Icon(Icons.edit),
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
