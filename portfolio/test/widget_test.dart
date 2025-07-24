import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('Portfolio app launches and shows Home screen', (
    WidgetTester tester,
  ) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Verify something from the Home screen is visible.
    expect(find.text('Home'), findsWidgets); // 'Home' nav button
    // You can also test for other widgets like logo, title, etc.
  });
}
