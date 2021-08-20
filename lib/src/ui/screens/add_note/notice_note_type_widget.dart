import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/config/naming.dart';
import 'package:notes/src/ui/screens/add_note/providers.dart';

class NoticeNoteTypeWidget extends ConsumerWidget {
  const NoticeNoteTypeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteType =
        ref.watch(addNoteProvider.select((value) => value.noteModel.type));
    return Container(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {
            ref.read(addNoteProvider.notifier).toggleType();
          },
          icon: Icon(noteType == NoteType.todo
              ? Icons.check_box_outlined
              : Icons.today_outlined),
          label: Text(noteType == NoteType.todo
              ? noticeNoteTypeTodo
              : noticeNoteTypeMemory)),
    );
  }
}
