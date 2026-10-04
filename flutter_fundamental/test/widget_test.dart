import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fundamental/main.dart';
import 'package:flutter_fundamental/core/constants/app_strings.dart';

void main() {
  testWidgets('App renders catalog screen, filters by category, and navigates to detail',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // 1. Render App
    await tester.pumpWidget(const WarungKatalogApp());
    await tester.pumpAndSettle();

    // Verify App Bar and Welcome Banner
    expect(find.text(AppStrings.appName), findsWidgets);
    expect(find.text(AppStrings.welcomeHeadline), findsOneWidget);
    expect(find.text('Nasi Goreng Spesial'), findsOneWidget);

    // 2. Test Category Filter (Tap Makanan)
    final makananFinder = find.text('Makanan (4)');
    await tester.ensureVisible(makananFinder);
    await tester.tap(makananFinder);
    await tester.pumpAndSettle();

    // Makanan items should be present, Minuman shouldn't
    expect(find.text('Nasi Goreng Spesial'), findsOneWidget);
    expect(find.text('Ayam Bakar Madu'), findsOneWidget);
    expect(find.text('Es Teh Manis Melati'), findsNothing);

    // 3. Test Category Filter (Tap Minuman)
    final minumanFinder = find.text('Minuman (3)');
    await tester.ensureVisible(minumanFinder);
    await tester.tap(minumanFinder);
    await tester.pumpAndSettle();

    expect(find.text('Nasi Goreng Spesial'), findsNothing);
    expect(find.text('Es Teh Manis Melati'), findsOneWidget);

    // 4. Reset to Semua
    final semuaFinder = find.text('Semua (9)');
    await tester.ensureVisible(semuaFinder);
    await tester.tap(semuaFinder);
    await tester.pumpAndSettle();
    expect(find.text('Nasi Goreng Spesial'), findsOneWidget);

    // 5. Test Navigation to Detail Screen
    final detailCardFinder = find.text('Nasi Goreng Spesial');
    await tester.ensureVisible(detailCardFinder);
    await tester.tap(detailCardFinder);
    await tester.pumpAndSettle();

    // Verify Detail Screen Contents
    expect(find.text(AppStrings.detailTitle), findsOneWidget);
    expect(find.text(AppStrings.menuDescription), findsOneWidget);
    expect(find.text(AppStrings.btnOrderNow), findsOneWidget);

    // 6. Test Quantity Increment
    expect(find.text('1'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('2'), findsOneWidget);

    // 7. Test Order Now SnackBar
    await tester.tap(find.text(AppStrings.btnOrderNow));
    await tester.pump();
    expect(find.textContaining('Nasi Goreng Spesial (2) ditambahkan'), findsOneWidget);
  });
}
