import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:notes/src/ui/screens/guest/guest_page.dart';
import 'package:path/path.dart' as path;

void main() {
  testGoldens('GuestPage', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
          child: Text('hihi'),
        ),
        name: 'Some widget',
      )
      ..addScenario(
        widget: Container(
          width: 100,
          height: 100,
          child: Image.asset('screenshots/rainbow.png'),
        ),
        name: 'image widget',
      );
    ;

    await tester.pumpDeviceBuilder(builder);
    // goldenFileComparator = CocoonFileComparator(path.join(
    //   (goldenFileComparator as LocalFileComparator).basedir.toString(),
    //   'guest_page',
    // ));
    await screenMatchesGolden(tester, 'some_widget');
  });
}

const double _kGoldenDiffTolerance = 0.005;

class CocoonFileComparator extends LocalFileComparator {
  CocoonFileComparator(String testFile) : super(Uri.parse(testFile));

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    print('golden: $golden');
    final ComparisonResult result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    print('result : ${result.passed}, ${result.diffPercent}');

    if (!result.passed && result.diffPercent > _kGoldenDiffTolerance) {
      final String error = await generateFailureOutput(result, golden, basedir);
      throw FlutterError(error);
    }
    if (!result.passed) {
      log('A tolerable difference of ${result.diffPercent * 100}% was found when '
          'comparing $golden.');
    }
    return result.passed || result.diffPercent <= _kGoldenDiffTolerance;
  }
}
