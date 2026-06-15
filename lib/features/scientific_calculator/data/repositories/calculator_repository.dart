import '../usecases/calculator_usecase.dart';
import 'package:get_it/get_it.dart';

class CalculatorRepository {
  final CalculatorUsecase _calculatorUsecase;

  CalculatorRepository(this._calculatorUsecase);

  Future<CalculatorModel> calculate(String expression) async {
    return await _calculatorUsecase.calculate(expression);
  }
}