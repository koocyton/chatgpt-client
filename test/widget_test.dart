import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aichat/main.dart';
import 'dart:io';
import 'package:aichat/utils/http_utils.dart';

void main() {

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  testWidgets(">>> test load config", (WidgetTester tester) async {
    await tester.runAsync(() async {
      await HttpUtils.stringGet(
        "https://www.google.com"
      )
      .then((response){
        debugPrint(response.toString());
      });
    });
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

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
