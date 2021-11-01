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
import 'package:notes/src/ui/screens/todo/move_to_trash_button.dart';
import 'package:notes/src/utils/time.dart';

import 'done_button.dart';

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

    return _TodoListRaw(
      noteModels: todos.map((e) => e.noteModel).toList(),
      finished: false,
    );
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
      physics: const NeverScrollableScrollPhysics(),
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
          finished: true,
        ),
      ],
    );
  }
}

class _TodoListRaw extends ConsumerWidget {
  const _TodoListRaw({
    Key? key,
    required this.noteModels,
    required this.finished,
  }) : super(key: key);

  final bool finished;
  final List<NoteModel> noteModels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: noteModels.length,
      itemBuilder: (context, index) {
        if (finished) {
          return _ItemFinishedRaw(noteModel: noteModels[index]);
        }
        return _ItemUnFinishedRaw(noteModel: noteModels[index]);
      },
    );
  }
}

class _ItemUnFinishedRaw extends ConsumerWidget {
  const _ItemUnFinishedRaw({
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
              DoneButton(noteModel: noteModel),
              MoveToTrashButton(noteModel: noteModel),
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

class _ItemFinishedRaw extends ConsumerWidget {
  const _ItemFinishedRaw({
    Key? key,
    required this.noteModel,
  }) : super(key: key);
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textStyle = TextStyle(decoration: TextDecoration.lineThrough);
    return ListTile(
      enabled: false,
      title: Text(noteModel.title, style: textStyle),
      subtitle: Text(noteModel.subTitle, style: textStyle),
      trailing: MoveToTrashButton(noteModel: noteModel),
    );
  }
}
