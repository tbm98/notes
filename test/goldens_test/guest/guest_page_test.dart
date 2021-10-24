import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:notes/src/ui/screens/guest/guest_page.dart';

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
        widget: const GuestPage(),
        name: 'Guest page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'guest_page');
  });
}
