import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'calculator_state.dart';

class CalculatorNotifier extends StateNotifier<CalculatorState> {
  CalculatorNotifier() : super(const CalculatorState());

  void onButtonPressed(String label) {
    switch (label) {
      case 'AC':
        clear();
        break;
      case '+/-':
        toggleSign();
        break;
      case '%':
        percentage();
        break;
      case '÷':
      case '×':
      case '−':
      case '+':
        inputOperator(label);
        break;
      case '=':
        calculate();
        break;
      case '.':
        inputDecimal();
        break;
      default:
        inputDigit(label);
        break;
    }
  }

  void inputDigit(String digit) {
    if (state.shouldResetDisplay || state.display == '0') {
      state = state.copyWith(
        display: digit,
        shouldResetDisplay: false,
      );
    } else {
      if (state.display.length >= 15) return;
      state = state.copyWith(
        display: state.display + digit,
      );
    }
  }

  void inputDecimal() {
    if (state.shouldResetDisplay) {
      state = state.copyWith(
        display: '0.',
        shouldResetDisplay: false,
      );
      return;
    }
    if (state.display.contains('.')) return;
    state = state.copyWith(
      display: '${state.display}.',
    );
  }

  void inputOperator(String op) {
    final double currentValue = double.tryParse(state.display) ?? 0.0;

    if (state.operator.isNotEmpty && !state.waitingForSecondOperand) {
      final double result = _performOperation(
        state.firstOperand,
        currentValue,
        state.operator,
      );
      final String formattedResult = _formatNumber(result);
      state = state.copyWith(
        display: formattedResult,
        expression: '$formattedResult $op',
        firstOperand: result,
        operator: op,
        waitingForSecondOperand: true,
        shouldResetDisplay: true,
      );
    } else {
      state = state.copyWith(
        expression: '${state.display} $op',
        firstOperand: currentValue,
        operator: op,
        waitingForSecondOperand: true,
        shouldResetDisplay: true,
      );
    }
  }

  void calculate() {
    if (state.operator.isEmpty) return;

    final double secondOperand = double.tryParse(state.display) ?? 0.0;

    if (state.operator == '÷' && secondOperand == 0.0) {
      state = state.copyWith(
        display: 'Error',
        expression: '${_formatNumber(state.firstOperand)} ${state.operator} 0',
        operator: '',
        waitingForSecondOperand: false,
        shouldResetDisplay: true,
        lastExpression:
            '${_formatNumber(state.firstOperand)} ${state.operator} 0',
      );
      return;
    }

    final double result = _performOperation(
      state.firstOperand,
      secondOperand,
      state.operator,
    );
    final String formattedResult = _formatNumber(result);
    final String fullExpression =
        '${_formatNumber(state.firstOperand)} ${state.operator} ${_formatNumber(secondOperand)}';

    state = state.copyWith(
      display: formattedResult,
      expression: fullExpression,
      firstOperand: result,
      operator: '',
      waitingForSecondOperand: false,
      shouldResetDisplay: true,
      lastExpression: fullExpression,
    );
  }

  void clear() {
    state = const CalculatorState();
  }

  void toggleSign() {
    if (state.display == '0' || state.display == 'Error') return;
    final double value = double.tryParse(state.display) ?? 0.0;
    final double negated = value * -1;
    state = state.copyWith(
      display: _formatNumber(negated),
    );
  }

  void percentage() {
    if (state.display == 'Error') return;
    final double value = double.tryParse(state.display) ?? 0.0;
    final double result = value / 100.0;
    state = state.copyWith(
      display: _formatNumber(result),
    );
  }

  double _performOperation(double a, double b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '−':
        return a - b;
      case '×':
        return a * b;
      case '÷':
        return a / b;
      default:
        return b;
    }
  }

  String _formatNumber(double number) {
    if (number.isInfinite || number.isNaN) {
      return 'Error';
    }
    if (number.abs() >= 1e15) {
      return number.toStringAsExponential(6);
    }
    if (number == number.toInt().toDouble()) {
      return number.toInt().toString();
    }
    String result = number.toStringAsFixed(10);
    if (result.contains('.')) {
      result = result.replaceAll(RegExp(r'0+$'), '');
      result = result.replaceAll(RegExp(r'\.$'), '');
    }
    return result;
  }
}

final StateNotifierProvider<CalculatorNotifier, CalculatorState>
    calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, CalculatorState>(
  (StateNotifierProviderRef<CalculatorNotifier, CalculatorState> ref) =>
      CalculatorNotifier(),
);
