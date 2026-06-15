import '../models/calculator_model.dart';
import '../error/failures.dart';
import 'package:math_expressions/math_expressions.dart';

abstract class CalculatorUsecase {
  Future<CalculatorModel> calculate(String expression);
}

class CalculatorUsecaseImpl implements CalculatorUsecase {
  @override
  Future<CalculatorModel> calculate(String expression) async {
    try {
      final parser = Parser();
      final expressionNode = parser.parse(expression);
      final result = expressionNode.evaluate(ExpressionEvaluator());
      return CalculatorModel(expression: expression, result: result);
    } catch (e) {
      return CalculatorModel(expression: expression, failure: Failure(message: e.toString()));
    }
  }
}