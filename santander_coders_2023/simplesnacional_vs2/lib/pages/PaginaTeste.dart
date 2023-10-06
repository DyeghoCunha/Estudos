import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/box_card.dart';
import 'package:simplesnacional_vs2/service/aliquotaSimplesNacional.dart';

class PaginaTeste extends StatefulWidget {
  const PaginaTeste({Key? key}) : super(key: key);

  @override
  State<PaginaTeste> createState() => _PaginaTesteState();
}

class _PaginaTesteState extends State<PaginaTeste> {
  TextEditingController brt12Controller = TextEditingController();
  SimplesNacionalAliquota aliquota = SimplesNacionalAliquota();
  double effectiveTaxRate = 0.0;
  final List<String> anexos = ["Anexo I", "Anexo II", "Anexo III", "Anexo IV", "Anexo V"];
  String? selectedAnexo = "Anexo I";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  ListTile(
          leading: const Icon(
            Icons.calculate_outlined,
            color: Colors.white,
            size: 40,
          ),
          splashColor: Colors.green,
          onTap: (){},
          title: Text("Simule sua Alíquota"),
          subtitle: Text("Duvidas ?"),
        ),
      ),
      body: ListView(
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
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  //  ListTile(
                  //   leading: const Icon(
                  //     Icons.calculate_outlined,
                  //     color: Colors.green,
                  //     size: 40,
                  //   ),
                  //   splashColor: Colors.green,
                  //   onTap: (){},
                  //   title: Text("Simule sua Alíquota"),
                  //   subtitle: Text("Duvidas ?"),
                  // ),
                  // const Divider(
                  //   height: 0,
                  //   color: Colors.green,
                  // ),
                  const SizedBox(height: 30),
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
                              child: Text("Escolha o Anexo"),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: brt12Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: "Faturamento Acumulado",
                        labelStyle: TextStyle(color: Colors.green),
                        hintText: "Digite o faturamento Acumulado",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          effectiveTaxRate = aliquota.funcCalculaAliqEfetiva(
                                  double.tryParse(brt12Controller.text) ?? 0.0, selectedAnexo ?? "Anexo I") ??
                              0.0;
                        });
                      },
                      child: Text("Calcule"),
                    ),
                  ),
                  const SizedBox(height: 45),
                  Divider(
                    color: Colors.green,
                  ),
                  const SizedBox(height: 5),
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
                          child: Text(
                            effectiveTaxRate.toStringAsFixed(2),
                            style: TextStyle(color: Colors.green, fontSize: 95, fontWeight: FontWeight.w300),
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
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
        const SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){},
              splashColor: Colors.greenAccent,
              borderRadius: BorderRadius.circular(8),
              child: const BoxCard(
                  boxContent: _AccountActionsContent(
                    icon: Icon(Icons.question_mark),
                    text: "Explicação",
                  )),
            ),
            InkWell(
              onTap: (){},
              splashColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
              child: const BoxCard(
                  boxContent: _AccountActionsContent(
                    icon: Icon(Icons.blur_linear_rounded),
                    text: "Detalhe",
                  )),
            ),
            InkWell(
              onTap: (){},
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
       Container(height: 50,)
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
        children: [Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: icon,
        ), Text(text, style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }

}