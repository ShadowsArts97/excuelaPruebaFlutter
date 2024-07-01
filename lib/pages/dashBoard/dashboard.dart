import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
      ),
      body: Center(
          child: Column(children: [
        ElevatedButton(
          onPressed: () {
            context.go('/card');
          },
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Tarjeta Educativa'),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.go('/progress');
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Barra de Progreso'),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.go('/quiz');
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Quiz'),
          ),
        )
      ])),
    ));
  }
}
