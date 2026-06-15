import '../domain/usecases/calculator_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorBlocProvider = StateNotifierProvider<CalculatorBloc, CalculatorModel>((ref) {
  return CalculatorBloc(ref.read(calculatorUsecaseProvider));
});

final calculatorUsecaseProvider = Provider<CalculatorUsecase>((ref) {
  return CalculatorUsecaseImpl();
});

class CalculatorBloc extends StateNotifier<CalculatorModel> {
  final CalculatorUsecase _calculatorUsecase;

  CalculatorBloc(this._calculatorUsecase) : super(CalculatorModel(expression: '', result: null, failure: null)) {
    _calculatorUsecase.calculate('').then((result) {
      state = result;
    });
  }

  void calculate(String expression) async {
    final result = await _calculatorUsecase.calculate(expression);
    state = result;
  }
}