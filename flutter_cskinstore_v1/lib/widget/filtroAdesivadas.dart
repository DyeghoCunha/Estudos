import 'package:flutter/material.dart';

import 'filtroDesgasteItem.dart';

class FiltroAdesivadas extends StatefulWidget {
  const FiltroAdesivadas({super.key});

  @override
  State<FiltroAdesivadas> createState() => _FiltroAdesivadasState();
}

class _FiltroAdesivadasState extends State<FiltroAdesivadas> {
  List<String> categoria = [
    "Adesivadas"
  ];
  List<bool> isItemSelected = List.filled(1, false);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Column(
          children:
          List.generate(categoria.length, (index) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  isItemSelected[index] = !isItemSelected[index];
                });
              },
              child: FiltroCheckBoxItem(
                isParametro: isItemSelected[index],
                titulo: categoria[index],
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
  }}