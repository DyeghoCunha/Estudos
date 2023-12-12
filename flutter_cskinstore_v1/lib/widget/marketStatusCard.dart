import 'package:flutter/material.dart';

class MarketStatusCard extends StatefulWidget {
  const MarketStatusCard({super.key});

  @override
  State<MarketStatusCard> createState() => _MarketStatusCardState();
}

class _MarketStatusCardState extends State<MarketStatusCard> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8,),
          child: Text(
            "Mercado",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 18
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Online",
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                  Switch(
                      inactiveThumbColor: Theme.of(context).colorScheme.onPrimary,
                      value: isOn,
                      onChanged: (value) {
                        setState(() {
                          isOn = value;
                        });
                      })
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Ao desativar, suas skins não ficarão visíveis para os compradores. Essa "
            "configuração não afeta as ofertas ativas.",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
