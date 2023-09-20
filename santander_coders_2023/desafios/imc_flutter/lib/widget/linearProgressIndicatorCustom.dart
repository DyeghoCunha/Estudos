import 'package:flutter/material.dart';

class LinearProgressIndicatorCustom extends StatefulWidget {
  const LinearProgressIndicatorCustom({super.key});

  @override
  State<LinearProgressIndicatorCustom> createState() => _LinearProgressIndicatorCustomState();
}

class _LinearProgressIndicatorCustomState extends State<LinearProgressIndicatorCustom> {
  double progress = 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyanAccent),
        borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50),
            topLeft: Radius.circular(8),bottomLeft: Radius.circular(8),),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 42),
            child: LinearProgressIndicator(
              minHeight: 25,
              borderRadius: BorderRadius.circular(8),
              value: progress, // Define o valor de progresso da barra.
              backgroundColor: Colors.grey[299], // Cor de fundo da barra.
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Cor da barra de progresso.
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.orangeAccent,
          )
        ],
      ),
    );
  }
}
