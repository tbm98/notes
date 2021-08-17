import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/add_note/notice_note_info_widget.dart';
import 'package:notes/src/ui/screens/add_note/notice_note_type_widget.dart';
import 'package:notes/src/ui/screens/add_note/providers.dart';
import 'package:notes/src/utils/time.dart';

import 'add_note_tool_bar_widget.dart';

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {
  late final FocusNode _contentFocusNode;

  @override
  void initState() {
    super.initState();
    _contentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _contentFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          IconButton(
              onPressed: () async {
                final date = await showDateTimePicker(context);
                print('date:$date');
                ref.read(addNoteProvider.notifier).alarmPicked(date);
              },
              icon: const Icon(Icons.add_alert_outlined))
        ],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      style: const TextStyle(fontSize: 24),
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                      onSubmitted: (_) => _contentFocusNode.requestFocus(),
                    ),
                    const NoticeNoteInfoWidget(),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Note',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                      focusNode: _contentFocusNode,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
              left: 0, right: 8, bottom: 8, child: AddNoteToolBarWidget())
        ],
      ),
    );
  }
}
