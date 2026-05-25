import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorUI extends StatelessWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Center(
        child: Text(
          'Calculator UI',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}