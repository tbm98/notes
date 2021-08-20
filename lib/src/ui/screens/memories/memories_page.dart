import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/home/providers.dart';

class MemoriesPage extends ConsumerWidget {
  const MemoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memories = ref.watch(memoriesNoteProvider);
    if (memories.isEmpty) {
      return const Center(
        child: Text('Memory empty!'),
      );
    }
    return ListView.builder(
      itemCount: memories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(memories[index].title),
          subtitle: Text(memories[index].note),
        );
      },
    );
  }
}
