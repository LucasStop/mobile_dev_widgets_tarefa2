import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_dev_widgets_tarefa2/main.dart';
import 'package:mobile_dev_widgets_tarefa2/profile_card_screen.dart';
import 'package:mobile_dev_widgets_tarefa2/calculator_screen.dart';

void main() {
  testWidgets('HomeScreen navigates to profile card and calculator', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Cartão de Perfil'), findsOneWidget);
    expect(find.text('Calculadora'), findsOneWidget);

    await tester.tap(find.text('Cartão de Perfil'));
    await tester.pumpAndSettle();
    expect(find.text('Cartão de Perfil Interativo'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Calculadora'));
    await tester.pumpAndSettle();
    expect(find.text('Calculadora Simples'), findsOneWidget);
  });

  testWidgets('ProfileCardScreen updates name via setState', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileCardScreen()));

    expect(find.text('Nome do Usuário'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Ana');
    await tester.tap(find.text('Atualizar Nome'));
    await tester.pump();

    expect(
      tester.widget<Text>(find.byKey(const Key('displayedNameText'))).data,
      'Ana',
    );
  });

  testWidgets('CalculatorScreen sums two numbers', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), '10');
    await tester.enterText(fields.at(1), '5');
    await tester.tap(find.text('+'));
    await tester.pump();

    expect(find.text('Resultado: 15.0'), findsOneWidget);
  });

  testWidgets('CalculatorScreen handles invalid input without crashing', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'abc');
    await tester.enterText(fields.at(1), '5');
    await tester.tap(find.text('+'));
    await tester.pump();

    expect(find.text('Resultado: entrada inválida'), findsOneWidget);
  });
}
