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
            expandedHeight: 115.0, // Ajuste conforme necessário
            floating: true, // Define se a app bar deve "flutuar" ao fazer rolagem
            pinned: false, // Mantém a app bar fixada no topo

            // Conteúdo da app bar
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                child: Header(),

              ), // Coloque seu widget Header aqui
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                RecentActivity(),
                AccountActions(),
                TaxDetail(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
