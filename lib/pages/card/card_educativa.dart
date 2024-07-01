import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardEducativa extends StatefulWidget {
  const CardEducativa({super.key});

  @override
  State<CardEducativa> createState() => _CardEducativaState();
}

class _CardEducativaState extends State<CardEducativa> {
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
        appBar: AppBar(title: const Text('Tarjeta Educativa')),
        body: _contenido(size),
      ),
    ));
  }

  // Conenido de la pagina de Tarjeta Educativa
  Widget _contenido(Size size) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              'https://i.pinimg.com/736x/b3/68/f3/b368f39e02d1de46b4fdfee6d75032c0.jpg',
              width: double.infinity,
              height: size.height * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Honda CBR600RR 2012',
                  style: TextStyle(
                    fontSize: size.height * 0.028,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.003),
                  child: const Text(
                    'This is the description of the card. It provides more details about the content of the card.',
                  ),
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('BUTTON 1'),
                onPressed: () {
                  // Hacer algo cuando se presione el boton1
                },
              ),
              TextButton(
                child: const Text('BUTTON 2'),
                onPressed: () {
                  // Hacer algo cuando se presione el boton2
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
