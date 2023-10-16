import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/service/utilidades.dart';
import 'package:simplesnacional_vs2/widgets/custom_drawer.dart';

import '../components/sections/account_actions.dart';
import '../components/sections/header.dart';
import '../components/sections/recent_activity.dart';
import '../components/sections/tax_detail.dart';

class DashBoardSimplesNacional extends StatefulWidget {
  DashBoardSimplesNacional({super.key, required this.rbt12, required this.faturamento, required this
      .dasSimplesNacional, required this.impostosDetalhados, required this.alqFutura, required this.alqEfetiva});

  double rbt12;
  double faturamento;
  double dasSimplesNacional;
  double alqEfetiva;
  double alqFutura;
  Map<String,double> impostosDetalhados;

  @override
  State<DashBoardSimplesNacional> createState() => _DashBoardSimplesNacionalState();
}

class _DashBoardSimplesNacionalState extends State<DashBoardSimplesNacional> {

  @override
  Widget build(BuildContext context) {
    String rbt12 = Utilidades.formatarNumeroComPontoVirgula(widget.rbt12??0.00);
    String faturamento = Utilidades.formatarNumeroComPontoVirgula(widget.faturamento??0.00);
    String dasSimplesNacional = Utilidades.formatarNumeroComPontoVirgula(widget.dasSimplesNacional??0.00);


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
                      child: Header(rbt12: rbt12,)),
                  const SizedBox(height: 5,),
                ],
              ), // Coloque seu widget Header aqui
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(

              [
                RecentActivity(faturamento: faturamento,dasSimplesNacional: dasSimplesNacional,rbt12:
                widget.rbt12,alqEfetiva: widget.alqEfetiva, alqFutura: widget.alqFutura),
                const AccountActions(),
                 TaxDetail(dasSimplesNacional: widget.dasSimplesNacional,impostoDetalhado: widget
                     .impostosDetalhados),
              ],
            ),
          ),
        ],
      ),
    );
  }
}