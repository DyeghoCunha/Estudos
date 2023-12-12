import 'package:flutter/material.dart';

class FiltroPreco extends StatefulWidget {
  const FiltroPreco({super.key});

  @override
  State<FiltroPreco> createState() => _FiltroPrecoState();
}

class _FiltroPrecoState extends State<FiltroPreco> {
  double preco = 0.0;

  @override

  Widget build(BuildContext context) {

    Color laranja = Theme.of(context).colorScheme.secondary;
    Color cinza = Theme.of(context).colorScheme.onPrimary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            children: [
              Text(
                "R\$ ${preco.round()}",
                style: TextStyle(color: cinza, fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SliderTheme(
                data: SliderThemeData(
                  overlayColor: laranja,
                  activeTickMarkColor: laranja,
                  activeTrackColor: laranja,
                  thumbColor: cinza,
                  inactiveTrackColor: Theme.of(context).colorScheme.background,
                ),
                child: Slider(
                  min: 0,
                  max: 10000,
                  divisions: 100,
                  value: preco,
                  onChanged: (value) {
                    setState(() {
                      preco = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: cinza, width: 2)),
                          focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: laranja, width: 2)),
                          focusColor: laranja,
                          floatingLabelStyle:
                          TextStyle(color: laranja, fontSize: 20, fontWeight: FontWeight.bold),
                          fillColor: Theme.of(context).colorScheme.background,
                          filled: true,
                          labelText: 'Mínimo',
                          labelStyle: TextStyle(color: cinza),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 50, color: Theme.of(context).colorScheme.background),
                          textAlign: TextAlign.center,
                        )),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: cinza, width: 2)),
                          focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: laranja, width: 2)),
                          focusColor: laranja,
                          floatingLabelStyle:
                          TextStyle(color: laranja, fontSize: 20, fontWeight: FontWeight.bold),
                          fillColor: Theme.of(context).colorScheme.background,
                          filled: true,
                          labelText: 'Máximo',
                          labelStyle: TextStyle(color: cinza),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4,),
                    Expanded(
                        flex: 1,
                        child: ElevatedButtonTheme(
                          data: ElevatedButtonThemeData(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                      (states) => Theme.of(context).colorScheme.background),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(side: BorderSide(color: laranja, width: 2),
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Ok",
                              style: TextStyle(color: laranja, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
