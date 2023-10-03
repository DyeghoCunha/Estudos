import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/box_card.dart';
import 'package:simplesnacional_vs2/components/sections/header.dart';

class Alubank extends StatelessWidget {
  const Alubank({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Column(
        children: <Widget> [
          Header(),
          BoxCard(boxContent: Text("Ola Mundo"), ),
        ],
      ),
    );
  }
}
