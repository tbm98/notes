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
          child: Image.asset('screenshots/rainbow.png'),
        ),
        name: 'image widget',
      );
    ;

    await tester.pumpDeviceBuilder(builder,
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ));
    // goldenFileComparator = CocoonFileComparator(path.join(
    //   (goldenFileComparator as LocalFileComparator).basedir.toString(),
    //   'guest_page',
    // ));
    await screenMatchesGolden(tester, 'image_widget');
  });
}
