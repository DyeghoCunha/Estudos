import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/pages/calculaSimples.dart';
import 'package:simplesnacional_vs2/service/utilidades.dart';

import '../components/box_card.dart';
import '../service/aliquotaSimplesNacional.dart';
import '../themes/theme_colors.dart';

class CalculaAliquota extends StatefulWidget {
  CalculaAliquota({super.key, required this.rbt12, required this.faturamento});

  String rbt12;
  String faturamento;

  @override
  State<CalculaAliquota> createState() => _CalculaAliquotaState();
}

class _CalculaAliquotaState extends State<CalculaAliquota> {
  TextEditingController brt12Controller = TextEditingController();
  SimplesNacionalAliquota aliquota = SimplesNacionalAliquota();

  double effectiveTaxRate = 0.0;

  final List<String> anexos = ["Anexo I", "Anexo II", "Anexo III", "Anexo IV", "Anexo V"];
  String? selectedAnexo = "Anexo I";
  String effectiveTaxRateString = "Erro";

  @override
  Widget build(BuildContext context) {
    double rbt12 = double.parse(widget.rbt12);
    String rbt12String = Utilidades.formatarNumeroComPontoVirgula(rbt12);
    double faturamento = double.parse(widget.faturamento);

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
        title: const ListTile(
          leading: Icon(
            Icons.calculate_outlined,
            color: Colors.white,
            size: 40,
          ),
          splashColor: Colors.green,
          title: Text("Simule sua Alíquota"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Theme.of(context).brightness == Brightness.light
                      ? const AssetImage("assets/images/fundo2.png")
                      : const AssetImage("assets/images/fundo2d.png"),
                  fit: BoxFit.cover,
                ),
              ),//aa
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    trailing: const Icon(Icons.question_mark),
                    splashColor: Colors.green,
                    titleAlignment: ListTileTitleAlignment.center,
                    onTap: () {},
                    title: const Text("Escolha seu Anexo"),
                    subtitle: const Text("Anexo de enquadramento Fiscal"),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1), // Green border
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              color: Colors.transparent,
                              child: const Text("Escolha o Anexo"),
                            ),
                          ),
                          DropdownButton(
                            value: selectedAnexo,
                            elevation: 10,
                            items: anexos.map((anexo) {
                              return DropdownMenuItem(
                                value: anexo,
                                child: Text(anexo),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedAnexo = value as String?;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    height: 0,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    title: Text("Faturamento Acumulado"),
                    subtitle: Text("Faturamento acumulado dos ultimos 12 meses"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/sifrao.png",
                              scale: 1.5,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              rbt12String,
                              style: TextStyle(fontSize: 38, color: Theme.of(context).colorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              FocusScope.of(context).unfocus(); //Tirar Depois

                              effectiveTaxRate =
                                  aliquota.funcCalculaAliqEfetiva(rbt12 ?? 0.0, selectedAnexo ?? "Anexo I") ??
                                      0.0;
                              effectiveTaxRateString = effectiveTaxRate > 0.0
                                  ? Utilidades.formatarNumeroComPontoVirgula(effectiveTaxRate)
                                  : "Erro";
                            },
                          );
                        },
                        child: const Text(
                          "Calcule a sua Aliquota",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.green, width: 1),
                          ),
                          child: Text.rich(
                            TextSpan(
                              text: effectiveTaxRate > 0.0 ? effectiveTaxRateString : "Alíquota",
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 75, fontWeight: FontWeight.w400),
                              children: [
                                effectiveTaxRate > 0.0 ? const TextSpan(text: "%",style: TextStyle
                                  (fontSize: 40)) :
                                const
                                TextSpan(text:
                                ""),
                              ],
                            ),
                          ),
                        ),
                        effectiveTaxRate > 0
                            ? Positioned(
                                right: 0,
                                top: 10,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        barrierColor: Colors.green.withOpacity(0.3),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            topLeft: Radius.circular(30),
                                          ),
                                        ),
                                        enableDrag: true,
                                        showDragHandle: true,
                                        context: context,
                                        builder: (ctx) => const _ModalExplicativo());
                                  },
                                  style: ButtonStyle(
                                    shape: const MaterialStatePropertyAll(CircleBorder()),
                                    backgroundColor: MaterialStatePropertyAll(Colors.green.withOpacity(0.5)),
                                  ),
                                  child: const Icon(
                                    Icons.question_mark,
                                    size: 50,
                                  ),
                                ))
                            : Container(),
                        effectiveTaxRate > 0
                            ? Positioned(
                                bottom: 8,
                                right: 8,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CalculaSimples(
                                          faturamento: faturamento,
                                          aliquota: effectiveTaxRate,
                                          anexo: selectedAnexo!,
                                          rbt12: rbt12,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    children: [
                                      Text("Calcular o Imposto"),
                                      Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModalExplicativo extends StatelessWidget {
  const _ModalExplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.center,
      children: [
        Text(
          "Entenda melhor a sua Alíquota!",
          style: TextStyle(fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              splashColor: Colors.greenAccent,
              borderRadius: BorderRadius.circular(8),
              child: const BoxCard(
                  boxContent: _AccountActionsContent(
                icon: Icon(Icons.question_mark),
                text: "Explicação",
              )),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
              child: const BoxCard(
                  boxContent: _AccountActionsContent(
                icon: Icon(Icons.blur_linear_rounded),
                text: "Detalhe",
              )),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.amberAccent,
              borderRadius: BorderRadius.circular(8),
              child: const BoxCard(
                  boxContent: _AccountActionsContent(
                icon: Icon(Icons.query_stats),
                text: "Gráficos",
              )),
            )
          ],
        ),
        Container(
          height: 50,
        )
      ],
    );
  }
}

class _AccountActionsContent extends StatelessWidget {
  final Icon icon;
  final String text;

  const _AccountActionsContent({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: icon,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
