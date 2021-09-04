import 'package:notes/src/core/share/share_handler.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/utils/time.dart';
import 'package:share_plus/share_plus.dart';

class ShareHandlerDefault extends ShareHandler {
  @override
  Future<void> share(NoteModel noteModel) async {
    await Share.share(
        '${noteModel.title} - ${formatDate(noteModel.timeDate)}\n${noteModel.note}');
  }
}
