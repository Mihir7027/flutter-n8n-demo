import 'package:flutter/foundation.dart';

@immutable
class CalculatorState {
  final String display;
  final String expression;
  final double firstOperand;
  final String operator;
  final bool waitingForSecondOperand;
  final bool shouldResetDisplay;
  final String lastExpression;

  const CalculatorState({
    this.display = '0',
    this.expression = '',
    this.firstOperand = 0.0,
    this.operator = '',
    this.waitingForSecondOperand = false,
    this.shouldResetDisplay = false,
    this.lastExpression = '',
  });

  CalculatorState copyWith({
    String? display,
    String? expression,
    double? firstOperand,
    String? operator,
    bool? waitingForSecondOperand,
    bool? shouldResetDisplay,
    String? lastExpression,
  }) {
    return CalculatorState(
      display: display ?? this.display,
      expression: expression ?? this.expression,
      firstOperand: firstOperand ?? this.firstOperand,
      operator: operator ?? this.operator,
      waitingForSecondOperand:
          waitingForSecondOperand ?? this.waitingForSecondOperand,
      shouldResetDisplay: shouldResetDisplay ?? this.shouldResetDisplay,
      lastExpression: lastExpression ?? this.lastExpression,
    );
  }
}
