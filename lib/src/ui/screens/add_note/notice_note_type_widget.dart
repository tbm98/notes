import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/naming.dart';
import 'package:notes/src/ui/screens/add_note/providers.dart';

class NoticeNoteTypeWidget extends ConsumerWidget {
  const NoticeNoteTypeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alarm = ref.watch(addNoteProvider.select((value) => value.alarm));
    return Row(
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColor.withAlpha(80)),
          child:
              Text(alarm == null ? noticeNoteTypeMemory : noticeNoteTypeTodo),
        ),
      ],
    );
  }
}
