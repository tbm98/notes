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
import 'package:notes/src/utils/time.dart';

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
        children: const [_UnfinishedTodoList(), _FinishedTodoList()],
      ),
    );
  }
}

class _UnfinishedTodoList extends ConsumerWidget {
  const _UnfinishedTodoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(unfinishedTodoProvider);
    if (todos == null || todos.isEmpty) {
      return const SizedBox();
    }

    return _TodoListRaw(noteModels: todos.map((e) => e.noteModel).toList());
  }
}

class _FinishedTodoList extends ConsumerWidget {
  const _FinishedTodoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(finishedTodoProvider);
    if (todos == null || todos.isEmpty) {
      return const SizedBox();
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return _SectionFinishedTodoList(todos[index]);
      },
    );
  }
}

class _SectionFinishedTodoList extends StatelessWidget {
  const _SectionFinishedTodoList(this.todos, {Key? key}) : super(key: key);
  final List<NoteModel> todos;

  @override
  Widget build(BuildContext context) {
    final title = formatDateWithoutTime(todos[0].timeDate);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            )),
        _TodoListRaw(
          noteModels: todos,
        ),
      ],
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
          composeProvider.overrideWithValue(ComposeStateNotifier(
              oldState: ComposeState(noteModel: noteModel))),
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
          enabled: !finished,
          title: Text(noteModel.title, style: textStyle),
          subtitle: Text(noteModel.subTitle, style: textStyle),
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
                      content: const Text('Moved 1 note to trash'),
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
