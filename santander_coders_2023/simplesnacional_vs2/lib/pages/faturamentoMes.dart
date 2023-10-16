import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/pages/calculaAliquota.dart';

import '../model/faturamentoAnualModel.dart';
import '../service/yearMonth.dart';
import '../themes/theme_colors.dart';
import '../widgets/inputFaturamento.dart';

class FaturamentoMes extends StatefulWidget {
  const FaturamentoMes({super.key});

  @override
  State<FaturamentoMes> createState() => _FaturamentoMesState();
}

class _FaturamentoMesState extends State<FaturamentoMes> {
  TextEditingController _faturamentoController = TextEditingController();
  TextEditingController _rbt12Controller = TextEditingController();

  final _faturamentoAnual = FaturamentoAnual(anos: {});
  int selectedYear = DateTime.now().year;
  String selectedMonth = 'Janeiro';
  List<TextEditingController> monthControllers = [];

  final yearMonth _yearMonth = yearMonth();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 12; i++) {
      monthControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: ThemeColors.appBarGradient, // Cores do gradiente
                begin: Alignment.topLeft, // Início do gradiente
                end: Alignment.bottomRight, )),),// Fim do gradiente
        title: const Text("Digite o Faturamento"),
      ),
      body: SingleChildScrollView(

       child:
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Theme.of(context).brightness == Brightness.light
                        ? const AssetImage("assets/images/fundo3.png")
                        : const AssetImage("assets/images/fundo3d.png"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                ListTile(
                  onTap: () {},
                  subtitle: const Text("Selecione o mês e ano que dejesa apurar o imposto"),
                  title: const Text("Selecione a referência"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Dropdown para selecionar o ano
                      DropdownButton<int>(
                        value: selectedYear,
                        onChanged: (int? newValue) {
                          setState(() {
                            selectedYear = newValue!;
                          });
                        },
                        items: yearMonth.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                      ),
                      const SizedBox(width: 16), // Espaço entre os Dropdowns
                      // Dropdown para selecionar o mês
                      DropdownButton<String>(
                        value: selectedMonth,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMonth = newValue!;
                            selectedYear = DateTime.now().year;
                            updateMonthControllers();
                          });
                        },
                        items: yearMonth.months.map((String month) {
                          return DropdownMenuItem<String>(
                            value: month,
                            child: Text(month),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.green,
                ),
                ListTile(
                  onTap: () {},
                  subtitle: const Text("É com este faturamento que será calculado o imposto"),
                  title: const Text("Digite o Faturamento do mês atual"),
                ),
                InputFaturamento(
                    faturamentoController: _faturamentoController,
                    selectedMonth: selectedMonth,
                    selectedYear: selectedYear),
                const Divider(
                  color: Colors.green,
                ),
                ListTile(
                  onTap: () {},
                  subtitle: const Text("Para podermos calcular a sua alíquota"),
                  title: const Text("Informe o Faturamento Acumulado dos últimos 12 meses"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _rbt12Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Faturamento dos ultimos 12 meses",
                      border:  OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _faturamentoAnual.adicionarFaturamento(
                          _yearMonth.getPreviousYear(0, selectedMonth, selectedYear),
                          _yearMonth.getPreviousMonth(0, selectedMonth),
                          double.parse(_faturamentoController.text));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.vertical,
                        children: [
                          const SizedBox(height: 20,),
                          Text(
                            "Faturamento de ${_yearMonth.getPreviousMonth(0, selectedMonth)} de ${_yearMonth.getPreviousYear(0, selectedMonth, selectedYear)}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          Text(
                            "até  ${_yearMonth.getPreviousMonth(11, selectedMonth)} de ${_yearMonth.getPreviousYear(12, selectedMonth, selectedYear)}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: Container()),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CalculaAliquota
                          (rbt12: _rbt12Controller.text, faturamento: _faturamentoController.text,),));
                        print("Faturamento 1:${_rbt12Controller.text}");
                        print("Faturamento 2:${_faturamentoController.text}");
                      },
               child: const Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [Text("Prosseguir"),Icon(Icons.arrow_forward_rounded)],
               ),

                    ),
                    const SizedBox(width: 8,)
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),

      ),
    );
  }

  void updateMonthControllers() {
    for (int i = 0; i < 12; i++) {
      monthControllers[i].text = "";
    }
  }
}
