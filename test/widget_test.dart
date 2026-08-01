import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_app/main.dart';

void main() {
  testWidgets('FitForge app builds without crashing', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FitForgeApp());
    await tester.pumpAndSettle();

    // Sanity check that the app shell rendered.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
