import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({Key? key, required this.label, required this.value}) : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }
}