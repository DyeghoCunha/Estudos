import 'package:flutter/material.dart';

import 'filtroDesgasteItem.dart';

class FiltroCategoria extends StatefulWidget {
  const FiltroCategoria({super.key});

  @override
  State<FiltroCategoria> createState() => _FiltroCategoriaState();
}

class _FiltroCategoriaState extends State<FiltroCategoria> {

  List<String> categoria = [
    "StatTrak™",
    "Souvenir"
  ];
  List<bool> isItemSelected = List.filled(2, false);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 97,
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
