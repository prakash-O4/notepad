import 'package:flutter/material.dart';

class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String date;
  BackGroundTile(
      {required this.backgroundColor, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          spacing: 7,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                bottom: 4,
              ),
              child: Text(
                date,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
