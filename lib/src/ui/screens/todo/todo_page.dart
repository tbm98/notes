import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';
import 'package:notes/src/ui/screens/todo/providers.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    return todos.map(
      data: (value) {
        if (value.noteModels.isEmpty) {
          return const Center(
            child: Text('Todo empty!'),
          );
        }
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _SectionTodoListByStatus(finished: false),
              _SectionTodoListByStatus(finished: true)
            ],
          ),
        );
      },
      init: (_) {
        return const SizedBox();
      },
    );
  }
}

class _SectionTodoListByStatus extends ConsumerWidget {
  const _SectionTodoListByStatus({
    Key? key,
    required this.finished,
  }) : super(key: key);
  final bool finished;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = finished
        ? ref.watch(finishedTodoProvider)
        : ref.watch(unfinishedTodoProvider);
    return todos.map(
      init: (_) => const SizedBox(),
      data: (value) {
        if (value.noteModels.isEmpty) {
          return const SizedBox();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(finished ? 'finished' : 'unfinished'),
            _TodoListRaw(noteModels: value.noteModels),
          ],
        );
      },
    );
  }
}

class _TodoListRaw extends ConsumerWidget {
  const _TodoListRaw({
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
          key: ValueKey<String>('todo-$index-finished=$finished'),
          tileColor: finished ? Colors.grey : null,
          title: Text(
            noteModels[index].title,
            style: textStyle,
          ),
          subtitle: Text(
            noteModels[index].note,
            style: textStyle,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                onChanged: (bool? value) {
                  ref
                      .read(allNoteProvider.notifier)
                      .updateNote(noteModels[index].copyWith(finished: value!));
                },
                value: noteModels[index].finished,
              ),
              IconButton(
                  onPressed: () async {
                    final scaffoldMessager = ScaffoldMessenger.of(context);
                    final allNoteNotifier = ref.read(allNoteProvider.notifier);
                    await allNoteNotifier.updateNote(
                        noteModels[index].copyWith(movedToTrash: true));
                    scaffoldMessager.showSnackBar(SnackBar(
                      content: Text('moved 1 note to trash'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          allNoteNotifier.updateNote(
                              noteModels[index].copyWith(movedToTrash: false));
                        },
                      ),
                    ));
                  },
                  icon: const Icon(CupertinoIcons.trash))
            ],
          ),
        );
      },
    );
  }
}
