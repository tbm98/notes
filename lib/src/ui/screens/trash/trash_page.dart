import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/dialogs/trash.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';
import 'package:notes/src/ui/screens/trash/providers.dart';

class TrashPage extends ConsumerWidget {
  const TrashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trash'),
          actions: [
            IconButton(
                onPressed: () async {
                  final result = await showConfirmEmptyTrashDialog(context);
                  if (result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Trash is empty')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text('Fail to empty trash')));
                  }
                },
                icon: const Icon(CupertinoIcons.trash_slash))
          ],
        ),
        body: const _TrashBody());
  }
}

class _TrashBody extends ConsumerWidget {
  const _TrashBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trashes = ref.watch(trashProvider);

    if (trashes == null) {
      return const SizedBox();
    }
    if (trashes.isEmpty) {
      return const Center(
        child: Text('Trash is empty'),
      );
    }
    return _TrashListRaw(noteModels: trashes.map((e) => e.noteModel).toList());
  }
}

class _TrashListRaw extends ConsumerWidget {
  const _TrashListRaw({
    Key? key,
    required this.noteModels,
  }) : super(key: key);
  final List<NoteModel> noteModels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: noteModels.length,
      itemBuilder: (context, index) {
        final finished = noteModels[index].finished;
        final textStyle = finished
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : const TextStyle();
        return ListTile(
          key: ValueKey<String>('trash-$index'),
          tileColor: finished ? Colors.grey : null,
          title: Text(
            noteModels[index].title,
            style: textStyle,
          ),
          subtitle: Text(
            noteModels[index].fbDocsId ?? '',
            style: textStyle,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                onChanged: null,
                value: noteModels[index].finished,
              ),
              IconButton(
                  onPressed: () {
                    ref.read(allNoteProvider.notifier).updateNote(
                        noteModels[index].copyWith(movedToTrash: false));
                  },
                  icon: Icon(
                    Icons.restore,
                    color: Theme.of(context).primaryColor,
                  ))
            ],
          ),
        );
      },
    );
  }
}
