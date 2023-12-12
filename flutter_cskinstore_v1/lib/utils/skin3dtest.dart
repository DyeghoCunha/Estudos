import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity, // Largura desejada
        height: 10, // Altura desejada
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft, // Começa da esquerda
            end: Alignment.centerRight, // Termina na direita
            colors: [
              Colors.green,
              Colors.yellow,
              Colors.orange,
              Colors.red,
            ],
          ),
        ),
      ),
    );
  }
}
