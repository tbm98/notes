import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/add_note/notice_note_type_widget.dart';

class NoticeNoteInfoWidget extends ConsumerWidget {
  const NoticeNoteInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const NoticeNoteTypeWidget(),
        Row(
          children: [
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ))),
              onPressed: () {},
              child: Icon(Icons.add_alert_outlined),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ))),
              onPressed: () {},
              icon: Icon(Icons.more_time),
              label: Text('set time'),
            ),
          ],
        ),
      ],
    );
  }
}
