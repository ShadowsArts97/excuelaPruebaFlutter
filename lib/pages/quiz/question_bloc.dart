// question_bloc.dart
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:excuela_test/models/question.dart';
import 'package:excuela_test/models/question_event.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(QuestionInitial()) {
    on<LoadQuestions>(_onLoadQuestions);
    on<AnswerQuestion>(_onAnswerQuestion);
  }

  void _onLoadQuestions(LoadQuestions event, Emitter<QuestionState> emit) {
    // Cargar las preguntas desde una fuente de datos
    final questions = [
      Question(
        text: 'What is the capital of France?',
        options: ['Paris', 'London', 'Berlin', 'Madrid'],
        correctAnswer: 'Paris',
      ),
      Question(
        text: 'Flutter is developed by Google.',
        correctAnswer: 'true',
        isMultipleChoice: false,
      ),
    ];
    emit(QuestionLoaded(questions: questions));
  }

  Future<void> _onAnswerQuestion(
      AnswerQuestion event, Emitter<QuestionState> emit) async {
    final state = this.state;
    if (state is QuestionLoaded) {
      final currentQuestion = state.questions[state.currentQuestionIndex];
      final isCorrect = currentQuestion.correctAnswer == event.selectedAnswer;
      emit(QuestionAnswered(isCorrect));

      // Esperar un momento y cargar la siguiente pregunta
      await Future.delayed(const Duration(seconds: 2));

      final nextIndex = state.currentQuestionIndex + 1;
      if (nextIndex < state.questions.length) {
        emit(QuestionLoaded(
          questions: state.questions,
          currentQuestionIndex: nextIndex,
        ));
      } else {
        emit(QuestionLoaded(
          questions: state.questions,
          currentQuestionIndex: nextIndex - 1,
        ));
      }
    }
  }
}
