import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/core/share/share_handler.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/ui/screens/memories/providers.dart';
import 'package:notes/src/utils/time.dart';

class MemoriesPage extends ConsumerWidget {
  const MemoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memories = ref.watch(memoriesNoteProvider);
    if (memories == null) {
      return const SizedBox();
    }
    if (memories.isEmpty) {
      return const Center(
        child: Text('Memory empty!'),
      );
    }
    final noteModels = memories.map((e) => e.noteModel).toList();
    return ListView.builder(
      itemCount: noteModels.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(noteModels[index].title),
          subtitle: Text(noteModels[index].note),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(formatDate(noteModels[index].timeDate)),
              IconButton(
                  onPressed: () {
                    getIt<ShareHandler>().share(noteModels[index]);
                  },
                  icon: const Icon(Icons.share))
            ],
          ),
        );
      },
    );
  }
}
