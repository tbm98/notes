import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/memories/providers.dart';

class MemoriesPage extends ConsumerWidget {
  const MemoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memories = ref.watch(memoriesNoteProvider);
    return memories.map(data: (value) {
      if (value.noteModels.isEmpty) {
        return const Center(
          child: Text('Memory empty!'),
        );
      }
      return ListView.builder(
        itemCount: value.noteModels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(value.noteModels[index].title),
            subtitle: Text(value.noteModels[index].note),
          );
        },
      );
    }, init: (_) {
      return const SizedBox();
    });
  }
}
