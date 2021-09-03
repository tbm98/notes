import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/compose/compose_page.dart';
import 'package:notes/src/ui/screens/compose/compose_state.dart';
import 'package:notes/src/ui/screens/compose/providers.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';
import 'package:notes/src/ui/screens/todo/providers.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    if (todos == null) {
      return const SizedBox();
    }
    if (todos.isEmpty) {
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
    if (todos == null || todos.isEmpty) {
      return const SizedBox();
    }

    return _TodoListRaw(noteModels: todos.map((e) => e.noteModel).toList());
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
        return _ItemListRaw(noteModel: noteModels[index]);
      },
    );
  }
}

class _ItemListRaw extends ConsumerWidget {
  const _ItemListRaw({
    Key? key,
    required this.noteModel,
  }) : super(key: key);
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finished = noteModel.finished;
    final textStyle = finished
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : const TextStyle();
    return OpenContainer<NoteModel>(
      openBuilder: (
        BuildContext context,
        void Function({NoteModel? returnValue}) action,
      ) {
        return ProviderScope(overrides: [
          composeProvider.overrideWithProvider(
            StateNotifierProvider.autoDispose<ComposeStateNotifier,
                ComposeState>(
              (ref) {
                return ComposeStateNotifier(
                    oldState: ComposeState(noteModel: noteModel));
              },
            ),
          ),
        ], child: ComposePage(returnValueCallback: action));
      },
      closedElevation: 0.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      closedBuilder: (
        BuildContext context,
        void Function() action,
      ) {
        return ListTile(
          onTap: action,
          tileColor: finished ? Colors.green : null,
          title: Text(noteModel.title, style: textStyle),
          subtitle: Text(noteModel.note, style: textStyle),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                onChanged: (bool? value) {
                  ref
                      .read(allNoteProvider.notifier)
                      .updateNote(noteModel.copyWith(finished: value!));
                },
                value: noteModel.finished,
              ),
              IconButton(
                  onPressed: () async {
                    final scaffoldMessager = ScaffoldMessenger.of(context);
                    final allNoteNotifier = ref.read(allNoteProvider.notifier);
                    await allNoteNotifier
                        .updateNote(noteModel.copyWith(movedToTrash: true));
                    scaffoldMessager.showSnackBar(SnackBar(
                      content: const Text('moved 1 note to trash'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          allNoteNotifier.updateNote(
                              noteModel.copyWith(movedToTrash: false));
                        },
                      ),
                    ));
                  },
                  icon: const Icon(CupertinoIcons.trash))
            ],
          ),
        );
      },
      onClosed: (returnValue) async {
        if (returnValue == null) {
          return;
        }
        ref.read(allNoteProvider.notifier).updateNote(returnValue);
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
