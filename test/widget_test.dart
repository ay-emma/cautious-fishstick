// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_test/home_view.dart';

import 'package:learn_test/main.dart';

void main() {
  group("Login view test - ", () {
    testWidgets('Test all widgets are in place', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      //verify that all text appears
      expect(find.text("Login view"), findsOneWidget);
      expect(find.text("Hello world"), findsOneWidget);
      expect(find.text('Login'), findsNothing);

      // Expects only 2 TextformFilled

      expect(find.byType(TextFormField), findsNWidgets(2));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
    });

    testWidgets("Interact with widget, insert invalid input - ",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.enterText(
          find.byKey(const ValueKey("emailKey")), "emmanuel@gmail");
      await tester.enterText(
          find.byKey(const ValueKey("passwordKey")), "emmanuel");

      await tester.tap(find.byType(ElevatedButton));

      await tester.pump();
      // expect to show some error text

      expect(find.text('Please fill in the right characters'), findsOneWidget);
      expect(find.text("Invalide email address"), findsOneWidget);
    });
    testWidgets("Interact with widget, insert valid input - ",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.enterText(
          find.byKey(const ValueKey("emailKey")), "adedokunemmanuel@gmail.com");
      await tester.enterText(
          find.byKey(const ValueKey("passwordKey")), "@whoisAyo100");

      await tester.tap(find.byType(ElevatedButton));

      await tester.pump();
      // expect to show some error text

      expect(find.text('Please fill in the right characters'), findsNothing);
      expect(find.text("Invalide email address"), findsNothing);
    });
    //end
  });

  group("Home page test - ", () {
    // test if a listTile has all its part.
    testWidgets("Test all widgets are in place and scrollview - ",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("Top Fintech Companies in Nigeria"), findsOneWidget);
      expect(find.text("Moneta"), findsNothing);
      expect(find.byType(ListView), findsOneWidget);
      // expect(find.byType(ListTile), 12);

      // to test the flutter does not build all the items
      // in the listview, until they are close to visible state.

      //scroll the list view up
      await tester.drag(
        find.byType(ListView),
        const Offset(0, -500),
      );

      await tester.pumpAndSettle();
      // this widget<listTile> is build
      expect(find.text("Moneta"), findsOneWidget);

      // the widget<listTile> is destroyed
      expect(find.text("Interswitch"), findsNothing);
    });
  });
}
