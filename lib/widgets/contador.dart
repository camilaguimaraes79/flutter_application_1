import 'package:flutter/material.dart';
 
class Contador extends StatefulWidget {
  final Color cor;
 
  const Contador({super.key, required this.cor});
 
  @override
  State<Contador> createState() => _ContadorState();
}
 
class _ContadorState extends State<Contador> {
  int _contador = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Barra superior igual à da imagem
      appBar: AppBar(
        title: const Text('Contador de cliques'),
      ),
      // 2. Corpo da tela centralizado
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _contador++;
            });
          },
          child: Container(
            height: 200,
            width: 200,
            color: widget.cor,
            child: Center(
              child: Text(
                'Cliques: $_contador',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}