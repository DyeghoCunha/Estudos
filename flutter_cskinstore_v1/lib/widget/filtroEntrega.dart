import 'package:flutter/material.dart';

class FiltroEntrega extends StatefulWidget {
  const FiltroEntrega({super.key});

  @override
  State<FiltroEntrega> createState() => _FiltroEntregaState();
}

class _FiltroEntregaState extends State<FiltroEntrega> {
  double dias = 0;
  bool skinBloqueadas = false;

  @override
  Widget build(BuildContext context) {
    Color laranja = Theme
        .of(context)
        .colorScheme
        .secondary;
    Color cinza = Theme
        .of(context)
        .colorScheme
        .onPrimary;

    Color activeTrackColor;
    Text resultadoDias = const Text(
      "Pronta Entrega",
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.greenAccent, fontSize: 20, fontWeight: FontWeight.bold),
    );

    if (dias == 0.0) {
      activeTrackColor = Colors.greenAccent;
      resultadoDias = const Text(
        "Pronta Entrega",
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.greenAccent, fontSize: 20, fontWeight: FontWeight.bold),
      );
    } else if (dias > 0.0 && dias <= 2.0) {
      activeTrackColor = Colors.greenAccent;
      resultadoDias = Text(
        dias == 1 ? "${dias.toInt()} dia" : "${dias.toInt()} dias",
        textAlign: TextAlign.start,
        style: TextStyle(color: activeTrackColor, fontSize: 20, fontWeight: FontWeight.bold),
      );
    } else if (dias > 2.0 && dias < 4.0) {
      activeTrackColor = Colors.amber;
      resultadoDias = Text(
        "${dias.toInt()} dias",
        textAlign: TextAlign.start,
        style: TextStyle(color: activeTrackColor, fontSize: 20, fontWeight: FontWeight.bold),
      );
    } else {
      activeTrackColor = Colors.red;
      resultadoDias = Text(
        "${dias.toInt()} dias ou mais",
        textAlign: TextAlign.start,
        style: TextStyle(color: activeTrackColor, fontSize: 20, fontWeight: FontWeight.bold),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(left: 23), width: double.infinity, child: resultadoDias),
            SliderTheme(
              data: SliderThemeData(
                overlayColor: laranja,
                activeTickMarkColor: activeTrackColor,
                // Define a cor aqui
                activeTrackColor: activeTrackColor,
                // Define a cor aqui
                thumbColor: activeTrackColor,
                inactiveTrackColor: Theme
                    .of(context)
                    .colorScheme
                    .background,
              ),
              child: Slider(
                min: 0,
                max: 7,
                divisions: 7,
                value: dias,
                onChanged: (value) {
                  setState(() {
                    dias = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CheckboxTheme(
                data: CheckboxThemeData(
                  side: BorderSide(color: cinza, width: 2),
                  splashRadius: 20,
                ),
                child: CheckboxListTile(
                  title: Text(
                    "Ocultar skins bloqueadas",
                    style: TextStyle(
                        color: skinBloqueadas ? laranja : cinza, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  dense: true,
                  value: skinBloqueadas,
                  onChanged: (value) {
                    setState(() {
                      skinBloqueadas = value!;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }}