import 'package:excuela_test/models/question.dart';

abstract class QuestionEvent {}

class LoadQuestions extends QuestionEvent {}

class AnswerQuestion extends QuestionEvent {
  final String selectedAnswer;

  AnswerQuestion(this.selectedAnswer);
}

// question_state.dart
abstract class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final bool isAnswered;

  QuestionLoaded({
    required this.questions,
    this.currentQuestionIndex = 0,
    this.isAnswered = false,
  });

  get isCorrect => null;
}

class QuestionAnswered extends QuestionState {
  final bool isCorrect;

  QuestionAnswered(this.isCorrect);
}
