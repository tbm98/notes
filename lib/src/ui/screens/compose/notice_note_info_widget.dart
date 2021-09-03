import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/compose/providers.dart';
import 'package:notes/src/utils/time.dart';

import 'notice_note_type_widget.dart';

class NoticeNoteInfoWidget extends ConsumerWidget {
  const NoticeNoteInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const NoticeNoteTypeWidget(),
        const _AlarmPickedNoticeWidget(),
        const _DatePickedNoticeWidget(),
      ],
    );
  }
}

class _AlarmPickedNoticeWidget extends ConsumerWidget {
  const _AlarmPickedNoticeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alarm =
        ref.watch(composeProvider.select((value) => value.noteModel.alarmDate));
    if (alarm == null) {
      return const SizedBox();
    }

    return Container(
        decoration: BoxDecoration(
            color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add_alert_outlined,
              size: 14,
            ),
            Text(
              formatDate(alarm),
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ));
  }
}

class _DatePickedNoticeWidget extends ConsumerWidget {
  const _DatePickedNoticeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date =
        ref.watch(composeProvider.select((value) => value.noteModel.timeDate));
    if (date == null) {
      return const SizedBox();
    }

    return Container(
        decoration: BoxDecoration(
            color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.today_outlined,
              size: 14,
            ),
            Text(
              formatDate(date),
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ));
  }
}
