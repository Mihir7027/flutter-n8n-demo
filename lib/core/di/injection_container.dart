import 'package:get_it/get_it.dart';
import '../features/scientific_calculator/data/repositories/calculator_repository.dart';
import '../features/scientific_calculator/domain/usecases/calculator_usecase.dart';

final sl = GetIt.instance;

void init() {
  // Core modules — register below as you add features
  // Feature modules — register below as you add features
  sl.registerLazySingleton<CalculatorRepository>(() => CalculatorRepository(CalculatorUsecaseImpl()));
}