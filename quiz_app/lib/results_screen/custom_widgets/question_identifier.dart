import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.questionIndex,
    required this.isCorrectAnswer,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final int questionNumber = questionIndex + 1;
    return Container(
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 90, 180, 255)
            : const Color.fromARGB(255, 255, 120, 90),
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: 25.0,
      height: 25.0,
      alignment: Alignment.center,
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.lato(
          color: const Color.fromARGB(180, 255, 255, 255),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
