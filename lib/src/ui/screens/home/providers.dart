import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentTabProvider = StateProvider<int>((ref) {
  return 0;
});
