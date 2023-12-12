import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/RelogioSorteio.dart';
import 'package:flutter_cskinstore_v1/widget/qtdApostadores.dart';

class SorteioCustomCard extends StatefulWidget {
  const SorteioCustomCard({super.key});

  @override
  State<SorteioCustomCard> createState() => _SorteioCustomCardState();
}

class _SorteioCustomCardState extends State<SorteioCustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Tier / Título",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: QtdApostadores(),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 380,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/red.png"), fit: BoxFit.fill),
                    ),
                    child: Image.asset(
                      'assets/images/arma1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                 const Padding(
                   padding: EdgeInsets.only(top: 200,left: 8,right: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text("Nome da Arma",style: TextStyle(color: Colors.white,fontWeight: FontWeight
                                .bold,fontSize: 16),),
                            Text("Descrição",style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        Text("R\$ 1.1015,00", style: TextStyle(color: Colors.white,fontWeight: FontWeight
                            .bold,fontSize: 20),),
                      ],
                    ),
                 )
                ],
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: RelogioSorteio(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
