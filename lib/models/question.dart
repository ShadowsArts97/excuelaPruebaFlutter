class Question {
  final String text;
  final List<String>? options;
  final String correctAnswer;
  final bool isMultipleChoice;

  Question({
    required this.text,
    this.options,
    required this.correctAnswer,
    this.isMultipleChoice = true,
  });
}
