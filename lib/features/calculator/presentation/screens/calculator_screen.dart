import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../logic/calculator_notifier.dart';
import '../../logic/calculator_state.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme cs = theme.colorScheme;
    final CalculatorState calcState = ref.watch(calculatorProvider);
    final CalculatorNotifier calcNotifier =
        ref.read(calculatorProvider.notifier);

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Calculator',
          style: theme.textTheme.titleLarge?.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: _DisplayPanel(
                colorScheme: cs,
                theme: theme,
                displayValue: calcState.display,
                expression: calcState.expression,
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: cs.outlineVariant.withOpacity(0.4),
              indent: 24,
              endIndent: 24,
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: _ButtonGrid(
                  onButtonPressed: calcNotifier.onButtonPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DisplayPanel extends StatelessWidget {
  const _DisplayPanel({
    required this.colorScheme,
    required this.theme,
    required this.displayValue,
    required this.expression,
  });

  final ColorScheme colorScheme;
  final ThemeData theme;
  final String displayValue;
  final String expression;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 16, 28, 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            expression,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.45),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              displayValue,
              style: theme.textTheme.displayLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w300,
                letterSpacing: -2,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonGrid extends StatelessWidget {
  const _ButtonGrid({required this.onButtonPressed});

  final void Function(String) onButtonPressed;

  static const List<List<List<dynamic>>> _rows = <List<List<dynamic>>>[
    <List<dynamic>>[
      <dynamic>['AC', CalculatorButtonType.function, 1],
      <dynamic>['+/-', CalculatorButtonType.function, 1],
      <dynamic>['%', CalculatorButtonType.function, 1],
      <dynamic>['÷', CalculatorButtonType.operator, 1],
    ],
    <List<dynamic>>[
      <dynamic>['7', CalculatorButtonType.number, 1],
      <dynamic>['8', CalculatorButtonType.number, 1],
      <dynamic>['9', CalculatorButtonType.number, 1],
      <dynamic>['×', CalculatorButtonType.operator, 1],
    ],
    <List<dynamic>>[
      <dynamic>['4', CalculatorButtonType.number, 1],
      <dynamic>['5', CalculatorButtonType.number, 1],
      <dynamic>['6', CalculatorButtonType.number, 1],
      <dynamic>['−', CalculatorButtonType.operator, 1],
    ],
    <List<dynamic>>[
      <dynamic>['1', CalculatorButtonType.number, 1],
      <dynamic>['2', CalculatorButtonType.number, 1],
      <dynamic>['3', CalculatorButtonType.number, 1],
      <dynamic>['+', CalculatorButtonType.operator, 1],
    ],
    <List<dynamic>>[
      <dynamic>['0', CalculatorButtonType.number, 2],
      <dynamic>['.', CalculatorButtonType.number, 1],
      <dynamic>['=', CalculatorButtonType.equals, 1],
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _rows.map((List<List<dynamic>> row) {
        return Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: row.map((List<dynamic> btn) {
              final String label = btn[0] as String;
              return CalculatorButton(
                label: label,
                type: btn[1] as CalculatorButtonType,
                flex: btn[2] as int,
                onTap: () => onButtonPressed(label),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
