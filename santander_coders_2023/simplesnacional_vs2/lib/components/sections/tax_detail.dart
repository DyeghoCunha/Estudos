import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/box_card.dart';
import 'package:simplesnacional_vs2/components/color_dot.dart';
import 'package:simplesnacional_vs2/components/content_division.dart';
import 'package:simplesnacional_vs2/service/utilidades.dart';
import 'package:simplesnacional_vs2/themes/theme_colors.dart';

class TaxDetail extends StatelessWidget {
  TaxDetail({super.key, required this.dasSimplesNacional, required this.impostoDetalhado});

  double dasSimplesNacional = 0.00;
  Map<String, double> impostoDetalhado;

  @override
  Widget build(BuildContext context) {
    String dasSimplesNacionalString = Utilidades.formatarNumeroComPontoVirgula(dasSimplesNacional);

    return dasSimplesNacionalString.length >4 ? Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 16),
                child: Text(
                  "Detalhes do Imposto",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              BoxCard(
                boxContent: _taxDetail(
                  dasSimplesNacionalString: dasSimplesNacionalString,
                  impostoDetalhado: impostoDetalhado,
                  dasSimplesNacional: dasSimplesNacional,
                ),
              ),
            ],
          ),
        ],
      ),
    ):Container();
  }
}

class _taxDetail extends StatelessWidget {
  _taxDetail(
      {super.key,
      required this.dasSimplesNacionalString,
      required this.impostoDetalhado,
      required this.dasSimplesNacional});

  double dasSimplesNacional;
  String dasSimplesNacionalString;
  Map<String, double> impostoDetalhado;
  List<String> nomeImposto = ["IR", "CSLL", "PIS", "COFINS", "CPP", "ICMS", "ISS", "IPI"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Simples Nacional:",
          style: TextStyle(color: ThemeColors.cinza),
        ),
        Text.rich(TextSpan(text: "R\$", children: [
          TextSpan(
            text: dasSimplesNacionalString,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ])),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: ContentDivision(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            "Detalhamento dos impostos da guia",
            style: TextStyle(color: ThemeColors.cinza),
          ),
        ),
        for(var imposto in nomeImposto)
          impostoDetalhado[imposto]! > 0?
        _Imposto(
            imposto: imposto,
            valor: Utilidades.formatarNumeroComPontoVirgula(impostoDetalhado[imposto]!),
            cor: Colors.green,
          dasSimplesNacional: dasSimplesNacional,
          valorDouble: impostoDetalhado[imposto]!,
        ): Container() ,
      ],
    );
  }
}

class _Imposto extends StatelessWidget {
  String imposto;
  String valor;
  double valorDouble;
  Color cor;
  double dasSimplesNacional;

  _Imposto({
    super.key,
    required this.imposto,
    required this.valor,
    required this.cor,
    required this.dasSimplesNacional,
    required this.valorDouble,
  });

  double CalculaIntensidade(double valor) {
    return (valor / dasSimplesNacional * 10);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.zero,
      titleAlignment: ListTileTitleAlignment.center,
      visualDensity: VisualDensity.comfortable,
      minLeadingWidth: 1,
      minVerticalPadding: 0,
      horizontalTitleGap: 10,
      splashColor: cor,
      onTap: () {},
      leading: _ColorDot(color: cor.withOpacity(CalculaIntensidade(valorDouble)>1?1:CalculaIntensidade
        (valorDouble)),tamanho:CalculaIntensidade(valorDouble) ),
      title: Text(
        imposto,
        style: const TextStyle(fontSize: 12, color: ThemeColors.cinza),
      ),
      subtitle: Text("R\$ $valor"),
      trailing: Icon(
        Icons.question_mark,
        color: ThemeColors.cinza.withOpacity(0.2),
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  _ColorDot({super.key, required this.color, required this.tamanho});

  final Color color;
  double tamanho;

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      width: 10+(tamanho*2),
      height: 10+(tamanho*2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}