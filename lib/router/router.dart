import 'package:excuela_test/pages/dashBoard/dashboard.dart';
import 'package:excuela_test/pages/progress_bar/progress_bar.dart';
import 'package:excuela_test/pages/quiz/quiz.dart';
import 'package:go_router/go_router.dart';
import '../pages/card/card_educativa.dart';

// Rutas de la aplicacion
class Rutas {
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const Dashboard()),
    GoRoute(path: '/card', builder: (context, state) => const CardEducativa()),
    GoRoute(
        path: '/progress', builder: (context, state) => const ProgressBar()),
    GoRoute(path: '/quiz', builder: (context, state) => const Quiz()),
  ]);
}
