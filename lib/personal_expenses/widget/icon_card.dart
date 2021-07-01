import 'package:flutter/material.dart';
import 'package:quiz/personal_expenses/constants.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  const IconCard({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(iconCardColor),
        borderRadius: BorderRadius.circular(
          14,
        ),
      ),
      child: Icon(
        icon,
        size: 26,
        color: Colors.white,
      ),
    );
  }
}
