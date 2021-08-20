import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/home/providers.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNoteProvider);
    if (todos.isEmpty) {
      return const Center(
        child: Text('Todo empty!'),
      );
    }
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index].title),
          subtitle: Text(todos[index].note),
        );
      },
    );
  }
}
