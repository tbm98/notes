import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/compose/providers.dart';
import 'package:notes/src/utils/time.dart';

import 'notice_note_info_widget.dart';

class ComposePage extends ConsumerStatefulWidget {
  const ComposePage({
    Key? key,
    required this.returnValueCallback,
  }) : super(key: key);

  final void Function({NoteModel? returnValue}) returnValueCallback;

  @override
  ConsumerState createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<ComposePage> {
  late final FocusNode _contentFocusNode;
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

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

  void _handleReturn() {
    final noteModel = ref.read(composeProvider.notifier).composeResult();
    widget.returnValueCallback(returnValue: noteModel);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: improve later. find other way to init textfield value from provider
    final composeState = ref.watch(composeProvider);
    if (_titleController.text.isEmpty &&
        composeState.noteModel.title.isNotEmpty) {
      _titleController.text = composeState.noteModel.title;
    }
    if (_noteController.text.isEmpty &&
        composeState.noteModel.subTitle.isNotEmpty) {
      _noteController.text = composeState.noteModel.subTitle;
    }
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: _handleReturn),
        actions: [
          const _ComposeAction(),
          IconButton(onPressed: _handleReturn, icon: const Icon(Icons.done))
        ],
      ),
      body: SizedBox.expand(
        child: GestureDetector(
          onTap: () {
            _contentFocusNode.requestFocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    style: const TextStyle(fontSize: 24),
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                    onSubmitted: (_) => _contentFocusNode.requestFocus(),
                    onChanged: ref.read(composeProvider.notifier).changedTitle,
                  ),
                  const NoticeNoteInfoWidget(),
                  TextField(
                    controller: _noteController,
                    decoration: const InputDecoration(
                      hintText: 'Note',
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    focusNode: _contentFocusNode,
                    onChanged: ref.read(composeProvider.notifier).changedNote,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ComposeAction extends ConsumerWidget {
  const _ComposeAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final composeType =
        ref.watch(composeProvider.select((value) => value.noteModel.type));
    if (composeType == NoteType.todo) {
      return IconButton(
        icon: const Icon(Icons.add_alert_outlined),
        onPressed: () async {
          final date = await showDateTimePicker(context);
          ref.read(composeProvider.notifier).alarmPicked(date);
        },
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.today_outlined),
        onPressed: () async {
          final date = await showDateTimePicker(context);
          ref.read(composeProvider.notifier).datePicked(date);
        },
      );
    }
  }
}
