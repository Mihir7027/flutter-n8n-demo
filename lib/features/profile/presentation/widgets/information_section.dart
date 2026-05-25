import 'package:flutter/material.dart';

class InformationSection extends StatelessWidget {
  final String phoneNumber;
  final String gender;
  final String dateOfBirth;
  final String location;
  final String profession;

  const InformationSection({
    super.key,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.location,
    required this.profession,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Phone Number: \$phoneNumber"),
            Text("Gender: \$gender"),
            Text("Date of Birth: \$dateOfBirth"),
            Text("Location: \$location"),
            Text("Profession: \$profession"),
          ],
        ),
      ),
    );
  }
} 