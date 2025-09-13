import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen/custom_widgets/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (int index = 0; index < questions.length; index++) {
      summary.add({
        'question_index': index,
        'question': questions[index].questionText,
        'correct_answer': questions[index].answers[0],
        'chosen_answer': chosenAnswers[index],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int numTotalQuestions = questions.length;
    final int numCorrectQuestions = summaryData
        .where((data) => data['chosen_answer'] == data['correct_answer'])
        .length;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.lato(color: Colors.white),
          ),
          const SizedBox(height: 30.0),
          QuestionSummary(summaryData: summaryData),
          const SizedBox(height: 30.0),
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: onRestart,
            icon: const Icon(Icons.refresh),
            label: Text('Restart Quiz!', style: GoogleFonts.lato()),
          ),
        ],
      ),
    );
  }
}
