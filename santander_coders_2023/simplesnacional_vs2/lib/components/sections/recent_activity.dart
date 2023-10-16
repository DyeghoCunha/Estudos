import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/box_card.dart';
import 'package:simplesnacional_vs2/components/color_dot.dart';
import 'package:simplesnacional_vs2/components/content_division.dart';
import 'package:simplesnacional_vs2/service/aliquotaSimplesNacional.dart';
import 'package:simplesnacional_vs2/service/utilidades.dart';
import 'package:simplesnacional_vs2/themes/theme_colors.dart';

class RecentActivity extends StatefulWidget {
  RecentActivity(
      {super.key,
      required this.faturamento,
      required this.dasSimplesNacional,
      required this.rbt12,
      required this.alqEfetiva,
      required this.alqFutura});

  String faturamento = "0,00";
  String dasSimplesNacional = "0,00";
  double rbt12 = 0.00;
  double faturamentoDouble = 0.00;
  double alqEfetiva = 0.00;
  double alqFutura = 0.00;

  @override
  State<RecentActivity> createState() => _RecentActivityState();
}

class _RecentActivityState extends State<RecentActivity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BoxCard(
        boxContent: _RecentActivityContent(
          faturamento: widget.faturamento,
          dasSimplesNacional: widget.dasSimplesNacional,
          rbt12: widget.rbt12,
          alqFutura: widget.alqFutura,
          alqEfetiva: widget.alqEfetiva,
        ),
      ),
    );
  }
}

class _RecentActivityContent extends StatelessWidget {
  _RecentActivityContent({
    super.key,
    required this.faturamento,
    required this.dasSimplesNacional,
    required this.rbt12,
    required this.alqEfetiva,
    required this.alqFutura,
  });

  String faturamento;
  String dasSimplesNacional;
  double rbt12;
  double alqEfetiva;
  double alqFutura;

  double proximaFaixaLinear = 0.0;

  String? QuantoFaltaProximaFaixa(double rbt12) {
    double proximaFaixa = 0.0;

    if (rbt12 <= 180000) {
      proximaFaixa = 180000 - rbt12;

      return Utilidades.formatarNumeroComPontoVirgula(proximaFaixa);
    } else if (rbt12 <= 360000) {
      proximaFaixa = 360000 - rbt12;
      proximaFaixaLinear = (100 - (proximaFaixa * 100) / 360000) / 100;
      return Utilidades.formatarNumeroComPontoVirgula(proximaFaixa);
    } else if (rbt12 <= 720000) {
      proximaFaixa = 720000 - rbt12;
      proximaFaixaLinear = (100 - (proximaFaixa * 100) / 720000) / 100;
      return Utilidades.formatarNumeroComPontoVirgula(proximaFaixa);
    } else if (rbt12 <= 1800000) {
      proximaFaixa = 1800000 - rbt12;
      proximaFaixaLinear = (100 - (proximaFaixa * 100) / 1800000) / 100;
      return Utilidades.formatarNumeroComPontoVirgula(proximaFaixa);
    } else if (rbt12 <= 3600000) {
      proximaFaixa = 3600000 - rbt12;
      proximaFaixaLinear = (100 - (proximaFaixa * 100) / 3600000) / 100;
      return Utilidades.formatarNumeroComPontoVirgula(proximaFaixa);
    } else if (rbt12 <= 4800000) {
      proximaFaixa = 4800000 - rbt12;
      proximaFaixaLinear = (100 - (proximaFaixa * 100) / 4800000) / 100;
      return Utilidades.formatarNumeroComPontoVirgula(proximaFaixa);
    } else {
      return Utilidades.formatarNumeroComPontoVirgula(rbt12);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ColorDot(
                    color: ThemeColors.recentActivity["spent"]!,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Faturamento",
                      style: TextStyle(color: ThemeColors.cinza),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "R\$",
                        children: <TextSpan>[
                          TextSpan(
                            text: faturamento,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ColorDot(color: ThemeColors.recentActivity["income"]!),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Imposto", style: TextStyle(color: ThemeColors.cinza)),
                    Text.rich(
                      TextSpan(
                        text: "R\$",
                        children: <TextSpan>[
                          TextSpan(
                            text: dasSimplesNacional,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Text("Próxima faixa em : R\$ ${QuantoFaltaProximaFaixa(rbt12)}",
              style: const TextStyle(color: ThemeColors.cinza)),
        ),
        LinearProgressIndicator(
          value: proximaFaixaLinear,
          minHeight: 8,
          borderRadius: BorderRadius.circular(5),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ContentDivision(),
        ),
        Text(
            alqEfetiva > 0.00 ?"A sua alíquota vai aumentar de ${Utilidades.formatarNumeroComPontoVirgula
        (alqEfetiva)}% para ${Utilidades.formatarNumeroComPontoVirgula(alqFutura)}% no próximo mês "
                : "Você precisa Calcular a sua alíquota!",
            style: TextStyle(color: ThemeColors.cinza)),
        Row(
          children: [
            Expanded(child: Container()),

            alqEfetiva > 0.00 ? TextButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.greenAccent.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text("Diga-me como!"),
            ):Container(),
          ],
        ),
      ],
    );
  }
}
