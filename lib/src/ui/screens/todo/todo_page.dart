import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNoteProvider);
    return todos.map(data: (value) {
      if (value.noteModel.isEmpty) {
        return const Center(
          child: Text('Todo empty!'),
        );
      }
      return ListView.builder(
        itemCount: value.noteModel.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(value.noteModel[index].title),
            subtitle: Text(value.noteModel[index].note),
          );
        },
      );
    }, init: (_) {
      return const SizedBox();
    });
  }
}
