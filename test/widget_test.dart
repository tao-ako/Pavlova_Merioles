import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pavlova_merioles/main.dart';

void main() {
  testWidgets('shows the recipe and surname in the app bar', (tester) async {
    await tester.pumpWidget(const PavlovaMeriolesApp());

    expect(find.text('Merioles'), findsOneWidget);
    expect(find.text('Strawberry Pavlova'), findsOneWidget);
    expect(find.byKey(const ValueKey('pavlova-image')), findsOneWidget);
    expect(
      find.textContaining('Russian ballerina Anna Pavlova'),
      findsOneWidget,
    );
  });

  testWidgets('shows the requested rating and recipe details', (tester) async {
    await tester.pumpWidget(const PavlovaMeriolesApp());

    expect(find.byIcon(Icons.star), findsNWidgets(3));
    expect(find.byIcon(Icons.star_border), findsNWidgets(2));
    expect(find.text('90 Reviews'), findsOneWidget);
    expect(find.text('PREP'), findsOneWidget);
    expect(find.text('25 min'), findsOneWidget);
    expect(find.text('COOK'), findsOneWidget);
    expect(find.text('1 gr'), findsOneWidget);
    expect(find.text('FEEDS'), findsOneWidget);
    expect(find.text('4-6 hrs'), findsOneWidget);
  });

  testWidgets('fits a narrow screen without layout overflow', (tester) async {
    tester.view.physicalSize = const Size(320, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PavlovaMeriolesApp());
    await tester.pump();

    expect(tester.takeException(), isNull);
  });
}
