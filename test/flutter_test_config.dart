import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:path/path.dart' as path;
import 'goldens_test/guest/guest_page_test.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await loadAppFonts();
  goldenFileComparator = CocoonFileComparator(path.join(
    (goldenFileComparator as LocalFileComparator).basedir.toString(),
    'guest_page',
  ));
  return testMain();
}
