import 'package:flutter/material.dart';

class DigiteCnpjModal extends StatefulWidget {
  const DigiteCnpjModal({super.key});

  @override
  State<DigiteCnpjModal> createState() => _DigiteCnpjModalState();
}

class _DigiteCnpjModalState extends State<DigiteCnpjModal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modal Example'),
        ),
        body: Center(
          child: Text("Implementar"),
          ),
        ),
    );
  }

}



