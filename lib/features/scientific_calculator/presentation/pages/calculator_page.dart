import '../bloc/calculator_bloc.dart';
import '../domain/models/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculatorBloc = ref.watch(calculatorBlocProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter expression',
              ),
              onChanged: (value) {
                ref.read(calculatorBlocProvider.notifier).calculate(value);
              },
            ),
            SizedBox(height: 16),
            Text('Result: ${calculatorBloc.result}'),
          ],
        ),
      ),
    );
  }
}