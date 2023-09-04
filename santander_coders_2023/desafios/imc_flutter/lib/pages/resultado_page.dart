import 'package:flutter/material.dart';

class ResultadoPage extends StatefulWidget {
   ResultadoPage({super.key, required this.resultado});
  final resultado;

  @override
  State<ResultadoPage> createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
          children: [
       Text("${widget.resultado}"),
      ],),
    );
  }
}
