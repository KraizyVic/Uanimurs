// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uanimurs/Logic/models/account_model.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';

import 'package:uanimurs/main.dart';
import 'package:isar/isar.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    late Isar isar;

    setUp(() async {
      final dir = await getTemporaryDirectory();
      isar = await Isar.open(
        [AccountModelSchema, AnimeModelSchema],
        directory: dir.path,
      );
    });

    testWidgets('MyApp builds', (tester) async {
      await tester.pumpWidget(MyApp(isar: isar));
    });

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
