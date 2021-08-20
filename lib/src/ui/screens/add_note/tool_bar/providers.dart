import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolbarExpandedNotifier extends StateNotifier<bool> {
  ToolbarExpandedNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final toolbarExpandedProvider =
    StateNotifierProvider.autoDispose<ToolbarExpandedNotifier, bool>((ref) {
  return ToolbarExpandedNotifier();
});
