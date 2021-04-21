// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:boring_flutter_app/main.dart';

void main() {
  testWidgets(
    'Clicking tile opens it',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.byIcon(Icons.launch), findsNothing);

      await tester.tap(find.byType(ExpansionTile).first);
      await tester.pumpAndSettle();

      var widget = find.byIcon(Icons.launch);
      expect(widget.first, findsOneWidget);
    },
    skip: true,
  );
}
