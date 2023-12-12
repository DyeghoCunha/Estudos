import 'package:flutter/material.dart';
import 'filtroCorItem.dart';

class FiltroCor extends StatefulWidget {
  const FiltroCor({Key? key});

  @override
  State<FiltroCor> createState() => _FiltroCorState();
}

class _FiltroCorState extends State<FiltroCor> {
  bool isVermelho = false;

  final Map<String, Color> colors = {
    'Branco': Colors.white,
    'Preto': Colors.black,
    'Vermelho': Colors.red,
    'Amarelo': Colors.yellow,
    'Azul': Colors.blue,
    'Verde': Colors.green,
    'Roxo': Colors.purple,
    'Rosa': Colors.pink,
    'Laranja': Colors.orange,
    'Cinza': Colors.grey,
  };
  Map<String, bool> selectedColors = {};

  @override
  void initState() {
    super.initState();
    // Inicialize o mapa de valores booleanos com todas as cores desselecionadas
    for (var color in colors.keys) {
      selectedColors[color] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 250,
      child: Row(
        children: [
        //  Expanded(child: Container()),
          Expanded(
            flex: 6,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final colorEntry = colors.entries.elementAt(index);
                final colorName = colorEntry.key;
                final color = colorEntry.value;
                return FiltroCorItem(
                  cor: color,
                  titulo: colorName,
                  isParametro: selectedColors[colorName]!,
                  onTap: (newValue) {
                    setState(() {
                      selectedColors[colorName] = newValue;
                    });
                  },
                );
              },
            ),
          ),
          Expanded(child: Container()),
          Expanded(
            flex: 6,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final colorEntry = colors.entries.elementAt(index + 5);
                final colorName = colorEntry.key;
                final color = colorEntry.value;
                return FiltroCorItem(
                  cor: color,
                  titulo: colorName,
                  isParametro: selectedColors[colorName]!,
                  onTap: (newValue) {
                    setState(() {
                      selectedColors[colorName] = newValue;
                    });
                  },
                );
              },
            ),
          ),
         // Expanded(child: Container()),
        ],
      ),
    );
  }
  }

