import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/pages/dashBoardSimplesNacional.dart';
import 'package:simplesnacional_vs2/service/aliquotaSimplesNacional.dart';
import 'package:simplesnacional_vs2/service/utilidades.dart';
import 'package:simplesnacional_vs2/widgets/custom_drawer.dart';

import '../themes/theme_colors.dart';

class CalculaSimples extends StatefulWidget {
  CalculaSimples({super.key, required this.faturamento, required this.aliquota, required this.anexo,
  required this.rbt12});

  double rbt12;
  double faturamento;
  double aliquota;
  String anexo;



  @override
  State<CalculaSimples> createState() => _CalculaSimplesState();
}

class _CalculaSimplesState extends State<CalculaSimples> {
  @override
  Widget build(BuildContext context) {
    double rbt12 = widget.rbt12;
    double faturamento = widget.faturamento;
    String anexo = widget.anexo;
    double alqEfetiva = widget.aliquota;
    double dasSimplesNacional = faturamento * (alqEfetiva/100);

    double alqFutura = SimplesNacionalAliquota().funcCalculaAliqEfetiva((rbt12+faturamento), anexo)!;

    
    Map<String, double>? impostos =
        SimplesNacionalAliquota().funcCalculaImpostoDetalhado(faturamento, anexo, alqEfetiva);

    List<String> nomeImposto = [
      "IR",
      "CSLL",
      "PIS",
      "COFINS",
      "CPP",
      "ICMS",
      "ISS",
      "IPI"
    ];
     String faturamentoString = Utilidades.formatarNumeroComPontoVirgula(faturamento);
     String alqEfetivaString = Utilidades.formatarNumeroComPontoVirgula(alqEfetiva);
     String dasSimplesNacionalString = Utilidades.formatarNumeroComPontoVirgula(dasSimplesNacional);

    return Scaffold(

      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: ThemeColors.appBarGradient, // Cores do gradiente
            begin: Alignment.topLeft, // Início do gradiente
            end: Alignment.bottomRight,
          )),
        ),
        title: const Text("Simples Nacional"),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                    ? const AssetImage("assets/images/fundo2.png")
                    : const AssetImage("assets/images/fundo2d.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {},
                  leading: const Icon(
                    Icons.monetization_on_outlined,
                    size: 40,
                    color: Colors.green,
                  ),
                  subtitle: Text("R\$ $faturamentoString"),
                  title: const Text("Faturamento do mês"),
                  trailing: const Icon(Icons.question_mark),
                ),
                ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {},
                  leading: const Icon(
                    Icons.percent,
                    size: 40,
                    color: Colors.green,
                  ),
                  subtitle: Text("$alqEfetivaString%"),
                  title: const Text("Alíquota "),
                  trailing: const Icon(Icons.question_mark),
                ),
                const Divider(
                  height: 0,
                  color: Colors.green,
                ),
                ListTile(
                  title: const Text("Valor total do Imposto"),
                  subtitle: Text("Calculado segundo o ${widget.anexo}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/logoSimples.png",
                              width: 40,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            "R\$ $dasSimplesNacionalString",
                            style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme
                        .primary),borderRadius: BorderRadius.circular(10),),
                    child: Column(
                      children: [
                        for(var imposto in nomeImposto)
                          impostos![imposto]! > 0 ?
                          ListTile(
                            onTap: (){},
                            titleAlignment: ListTileTitleAlignment.center,
                            leading: Icon(Icons.circle,color: Theme.of(context).primaryColor.withOpacity(0.5),),
                            title:  Text(imposto),
                            subtitle: Text("R\$ ${Utilidades.formatarNumeroComPontoVirgula(impostos[imposto]!)}"),
                            trailing: const Icon(Icons.question_mark),
                          ):Container(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            DashBoardSimplesNacional(rbt12: rbt12, faturamento: faturamento,
                                dasSimplesNacional: dasSimplesNacional, impostosDetalhados: impostos!,
                                alqFutura: alqFutura,alqEfetiva: alqEfetiva),));
                      }, child: const Text("Ir para o DashBoard"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
