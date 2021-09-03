import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/compose_notes/providers.dart';
import 'compose_note_state.dart';
import 'notice_note_info_widget.dart';
import 'tool_bar/add_note_tool_bar_widget.dart';

class ComposeNotePage extends ConsumerStatefulWidget {
  const ComposeNotePage({
    Key? key,
    required this.returnValueCallback,
  }) : super(key: key);

  final void Function({NoteModel? returnValue}) returnValueCallback;

  @override
  ConsumerState createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<ComposeNotePage> {
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
    final noteModel = ref.read(composeNoteProvider.notifier).composeResult();
    widget.returnValueCallback(returnValue: noteModel);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: improve later
    final composeState = ref.watch(composeNoteProvider);
    if(_titleController.text.isEmpty){
      _titleController.text = composeState.noteModel.title;
    }
    if(_noteController.text.isEmpty){
      _noteController.text = composeState.noteModel.note;
    }
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: _handleReturn),
        actions: [
          IconButton(onPressed: _handleReturn, icon: const Icon(Icons.done))
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
                      onChanged:
                          ref.read(composeNoteProvider.notifier).changedTitle,
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
                      onChanged:
                          ref.read(composeNoteProvider.notifier).changedNote,
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
