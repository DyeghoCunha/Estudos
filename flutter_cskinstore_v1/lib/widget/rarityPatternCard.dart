import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/models/questionDb.dart';
import 'package:flutter_cskinstore_v1/widget/btnQuestion.dart';

class RarityPatternCard extends StatelessWidget {
  const RarityPatternCard({super.key});

  @override
  Widget build(BuildContext context) {
    String patter = questionDb["Pattern"]!;
    String rarity = questionDb["rarity"]!;

    return Card(
      child: Column(
        children: [
          TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pattern",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 20),
                  ),
                  Row(
                    children: [
                      const Text("178", style: TextStyle(color: Colors.white,fontSize: 20),),
                      BtnQuestion(texto: patter, titulo: "Pattern"),
                    ],
                  ),
                ],
              )),
          Divider(height: 1,color: Theme.of(context).colorScheme.onPrimary),
          TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rarity",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 20),
                  ),
                  Row(
                    children: [
                      const Text("Covert", style: TextStyle(color: Colors.red,fontSize: 20),),
                      BtnQuestion(texto: rarity, titulo: "Rarity"),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
