import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/filtroDesgasteItem.dart';

class FiltroDesgaste extends StatefulWidget {
  const FiltroDesgaste({Key? key});

  @override
  State<FiltroDesgaste> createState() => _FiltroDesgasteState();
}

class _FiltroDesgasteState extends State<FiltroDesgaste> {

  List<String> desgaste = [
    "Factory New (FN)",
    "Minimal Wear (MW)",
    "Field Tested (FT)",
    "Well Worn (WW)",
    "Battle Scarred (BS)",
    "Vanilla",
  ];
  List<bool> isItemSelected = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 290,
        child: Column(
          children:
            List.generate(desgaste.length, (index) {
            return ElevatedButton(
              onPressed: (){setState(() {
                isItemSelected[index] = !isItemSelected[index];
              });},
              child: FiltroCheckBoxItem(
                isParametro: isItemSelected[index],
                titulo: desgaste[index],
                onTap: (value) {
                  setState(() {
                    isItemSelected[index] = value;
                  });
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
