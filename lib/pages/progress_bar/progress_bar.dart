import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: false);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Variable para obtener el tamaño de la pantalla
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: PopScope(
            onPopInvoked: (didPop) {
              if (didPop) {
                context.goNamed('/');
              }
            },
            child: Scaffold(
              appBar: AppBar(title: const Text('Barra de Progreso')),
              body: _contenido(size),
            )));
  }

  Widget _contenido(Size size) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 3),
      builder: (context, value, child) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.25,
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: 10,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              Positioned(
                child: Text(
                  '${(value * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      onEnd: () {
        _controller.repeat();
      },
    );
  }
}
