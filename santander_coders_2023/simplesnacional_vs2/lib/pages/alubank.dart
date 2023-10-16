import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/sections/account_actions.dart';
import 'package:simplesnacional_vs2/components/sections/header.dart';
import 'package:simplesnacional_vs2/components/sections/recent_activity.dart';
import 'package:simplesnacional_vs2/components/sections/tax_detail.dart';

class Alubank extends StatelessWidget {
  const Alubank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
           SliverAppBar(
            // Define a altura da app bar quando ela estiver "enrolada"
            expandedHeight: 113.0, // Ajuste conforme necessário
            floating: true, // Define se a app bar deve "flutuar" ao fazer rolagem
            pinned: false, // Mantém a app bar fixada no topo

            // Conteúdo da app bar
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft:
                      Radius.circular(10)),
                      boxShadow: kElevationToShadow[3],
                    ),
                      child:Header(rbt12: "0,00",)),
                   const SizedBox(height: 5,),
                ],
              ), // Coloque seu widget Header aqui
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                RecentActivity(faturamento: "0,00",dasSimplesNacional: "0,00",rbt12: 0.00,alqEfetiva: 0.00,
                    alqFutura: 0.00,),
                AccountActions(),
                TaxDetail(impostoDetalhado: {"Sem Valor":0.00},dasSimplesNacional: 0.00),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
