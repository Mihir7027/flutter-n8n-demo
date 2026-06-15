import '../error/failures.dart';

class CalculatorModel {
  final String expression;
  final double? result;
  final Failure? failure;

  CalculatorModel({required this.expression, this.result, this.failure});
}