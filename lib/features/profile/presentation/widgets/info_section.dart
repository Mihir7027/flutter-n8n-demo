import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Me', style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 4),
        Text(
          'Software Developer with a passion for mobile applications.',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}