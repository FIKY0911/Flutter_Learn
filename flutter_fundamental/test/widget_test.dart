import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fundamental/main.dart';

void main() {
  testWidgets('KasirApp splash screen and home screen render correctly',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // 1. Render Kasir App
    await tester.pumpWidget(const KasirApp());
    expect(find.text('Aplikasi Kasir POS'), findsOneWidget);

    // 2. Advance time for Splash timer (1 second)
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // 3. Verify Home Screen loaded
    expect(find.text('Kasir Warung Mas Rusdi'), findsOneWidget);
    expect(find.text('Nasi Goreng Spesial'), findsOneWidget);

    // 4. Test Category Filter using ChoiceChip
    await tester.tap(find.widgetWithText(ChoiceChip, 'Makanan'));
    await tester.pumpAndSettle();
    expect(find.text('Nasi Goreng Spesial'), findsOneWidget);
  });
}
