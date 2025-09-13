class Question {
  const Question({required this.questionText, required this.answers});

  final String questionText;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
