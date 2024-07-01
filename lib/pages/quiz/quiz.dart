import 'package:excuela_test/models/question_event.dart';
import 'package:excuela_test/pages/quiz/question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    // Variable para obtener el tamaño de la pantalla
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => QuestionBloc()..add(LoadQuestions()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: _contenido(size),
      ),
    );
  }
}

Widget _contenido(Size size) {
  return BlocBuilder<QuestionBloc, QuestionState>(
    builder: (context, state) {
      if (state is QuestionInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is QuestionLoaded) {
        final question = state.questions[state.currentQuestionIndex];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(question.text,
                  style: TextStyle(fontSize: size.height * 0.03)),
              if (question.isMultipleChoice && question.options != null)
                ...question.options!.map((option) {
                  return ListTile(
                    title: Text(option),
                    leading: Radio<String>(
                      value: option,
                      groupValue:
                          state.isAnswered ? question.correctAnswer : null,
                      onChanged: state.isAnswered
                          ? null
                          : (value) {
                              context
                                  .read<QuestionBloc>()
                                  .add(AnswerQuestion(value!));
                            },
                    ),
                  );
                })
              else
                ...['true', 'false'].map((option) {
                  return ListTile(
                    title: Text(option),
                    leading: Radio<String>(
                      value: option,
                      groupValue:
                          state.isAnswered ? question.correctAnswer : null,
                      onChanged: state.isAnswered
                          ? null
                          : (value) {
                              context
                                  .read<QuestionBloc>()
                                  .add(AnswerQuestion(value!));
                            },
                    ),
                  );
                }),
              if (state.isAnswered)
                Text(
                  state.isCorrect! ? 'Correct!' : 'Incorrect',
                  style: TextStyle(
                    fontSize: 20,
                    color: state.isCorrect! ? Colors.green : Colors.red,
                  ),
                ),
            ],
          ),
        );
      }
      return Container();
    },
  );
}



/*
class QuizWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionBloc()..add(LoadQuestions()),
      child: Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: BlocBuilder<QuestionBloc, QuestionState>(
          builder: (context, state) {
            if (state is QuestionInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is QuestionLoaded) {
              final question = state.questions[state.currentQuestionIndex];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(question.text, style: TextStyle(fontSize: 24)),
                    if (question.isMultipleChoice && question.options != null)
                      ...question.options!.map((option) {
                        return ListTile(
                          title: Text(option),
                          leading: Radio<String>(
                            value: option,
                            groupValue: state.isAnswered ? question.correctAnswer : null,
                            onChanged: state.isAnswered ? null : (value) {
                              context.read<QuestionBloc>().add(AnswerQuestion(value!));
                            },
                          ),
                        );
                      }).toList()
                    else
                      ...['true', 'false'].map((option) {
                        return ListTile(
                          title: Text(option),
                          leading: Radio<String>(
                            value: option,
                            groupValue: state.isAnswered ? question.correctAnswer : null,
                            onChanged: state.isAnswered ? null : (value) {
                              context.read<QuestionBloc>().add(AnswerQuestion(value!));
                            },
                          ),
                        );
                      }).toList(),
                    if (state.isAnswered)
                      Text(
                        state.isCorrect! ? 'Correct!' : 'Incorrect',
                        style: TextStyle(
                          fontSize: 20,
                          color: state.isCorrect! ? Colors.green : Colors.red,
                        ),
                      ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}



*/