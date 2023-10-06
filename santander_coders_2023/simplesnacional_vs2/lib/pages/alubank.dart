import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/box_card.dart';
import 'package:simplesnacional_vs2/components/color_dot.dart';
import 'package:simplesnacional_vs2/components/content_division.dart';
import 'package:simplesnacional_vs2/components/sections/account_actions.dart';
import 'package:simplesnacional_vs2/components/sections/header.dart';
import 'package:simplesnacional_vs2/components/sections/recent_activity.dart';
import 'package:simplesnacional_vs2/components/sections/tax_detail.dart';
import '../themes/theme_colors.dart';

class Alubank extends StatelessWidget {
  const Alubank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // Define a altura da app bar quando ela estiver "enrolada"
            expandedHeight: 125.0, // Ajuste conforme necessário
            floating: false, // Define se a app bar deve "flutuar" ao fazer rolagem
            pinned: true, // Mantém a app bar fixada no topo

            // Conteúdo da app bar
            flexibleSpace: FlexibleSpaceBar(
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
