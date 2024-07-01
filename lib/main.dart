import 'package:excuela_test/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return rutas();
  }
}

Widget rutas() {
  return MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: Rutas().router,
  );
}
