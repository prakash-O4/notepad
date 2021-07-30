import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/personal_expenses/constants.dart';

class SimpleCustomAlert extends StatelessWidget {
  final String text;
  final bool isDev;
  SimpleCustomAlert({required this.text, required this.isDev});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Helper(
        text: text,
        isDev: isDev,
      ),
    );
  }
}

class Helper extends StatelessWidget {
  final String text;
  final bool isDev;
  const Helper({required this.text, required this.isDev});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(22),
      color: Color(backgroundColor),
      elevation: 5,
      child: Container(
        padding: isDev == true
            ? EdgeInsets.only(
                left: 12,
                right: 12,
                top: 4,
              )
            : EdgeInsets.only(
                left: 12,
                right: 12,
                top: 16,
              ),
        height: isDev == true
            ? MediaQuery.of(context).size.height / 3.2
            : MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width * 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(
            backgroundColor,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                text,
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            isDev == true
                ? Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Feedback will be appreciated!",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        color: Colors.white70,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
