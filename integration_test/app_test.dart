import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learn_test/main.dart' as app;

// To run test => flutter test integration_test/app_test.dart

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test-", () {
    testWidgets("Tap on a button and the form goes red", (tester) async {
      app.main();

      await tester.pumpAndSettle();

      expect(find.text("Hello world"), findsOneWidget);

      final Finder btn = find.byType(ElevatedButton);

      await tester.tap(btn);

      await tester.pumpAndSettle();
    });
    testWidgets("Fill the form and tap on a button", (tester) async {
      app.main();

      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const ValueKey("emailKey")),
          "adedokunemmanuel250@gmail.com");

      await tester.enterText(
          find.byKey(const ValueKey("passwordKey")), "Emma@123");

      final Finder btn = find.byType(ElevatedButton);

      await tester.tap(btn);

      await tester.pumpAndSettle();

      // home page
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("Top Fintech Companies in Nigeria"), findsOneWidget);

      expect(find.text("Interswitch"), findsOneWidget);
      //proof that flutter hasn't renders all the widgets
      expect(find.text("Moneta"), findsNothing);

      //scroll the list view up
      await tester.drag(
        find.byType(ListView),
        const Offset(0, -500),
      );

      await tester.pumpAndSettle();
      expect(find.text("Moneta"), findsOneWidget);
    });
  });
}
