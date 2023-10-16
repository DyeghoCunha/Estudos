import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simplesnacional_vs2/service/yearMonth.dart';
import 'package:simplesnacional_vs2/widgets/dropdown_month_year.dart';
import 'package:simplesnacional_vs2/widgets/inputFaturamento.dart';

import '../model/faturamentoAnualModel.dart';


class FaturamentoDoze extends StatefulWidget {
  const FaturamentoDoze({Key? key}) : super(key: key);

  @override
  State<FaturamentoDoze> createState() => _HiveTestState();
}

class _HiveTestState extends State<FaturamentoDoze> {
  TextEditingController _faturamentoController = TextEditingController();
  TextEditingController _dataController = TextEditingController();


  final _faturamentoAnual = FaturamentoAnual(anos: {});
  int selectedYear = DateTime.now().year;
  String selectedMonth = 'Janeiro';
  List<TextEditingController> monthControllers = [];
  late Box boxFaturamentoDoze;

  final yearMonth _yearMonth = yearMonth();



  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 12; i++) {
      monthControllers.add(TextEditingController());
    }
   _carregarHive();
  }

  void _carregarHive()async{
    if(Hive.isBoxOpen("box_faturamentoDoze")){
      boxFaturamentoDoze = Hive.box("box_faturamentoDoze");
    }else {
      boxFaturamentoDoze = await Hive.openBox("box_faturamentoDoze");
    }
    // var faturamentoAnual =  boxFaturamentoDoze.get("faturamentoAnual");
    // var faturamentoMes =  boxFaturamentoDoze.get("faturamentoMes");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration:  BoxDecoration(
              image: DecorationImage( image : Theme.of(context).brightness == Brightness.light
                  ? const AssetImage("assets/images/fundo3.png")
                  : const AssetImage("assets/images/fundo3d.png"),fit: BoxFit.cover)
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                  },
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
                            selectedYear = DateTime
                                .now()
                                .year;
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

                const Divider(color: Colors.green,),
                ListTile(
                  onTap: () {

                  },
                  subtitle: const Text("É com este faturamento que será calculado o imposto"),
                  title: const Text("Digite o Faturamento do mês atual"),
                ),
              InputFaturamento(faturamentoController: _faturamentoController, selectedMonth: selectedMonth,
                  selectedYear: selectedYear),
                const Divider(color: Colors.green,),
                ListTile(
                  onTap: () {
                    print(_faturamentoAnual.anos[2023]!["Fevereiro"]);
                  },
                  subtitle: const Text("Para podermos calcular a sua alíquota"),
                  title: const Text("Informe o Faturamento dos últimos 12 meses"),
                ),
                for (int i = 0; i < 12; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: monthControllers[i],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Faturamento de ${_yearMonth.getPreviousMonth(i,selectedMonth)} de "
                            "${_yearMonth.getPreviousYear(i,selectedMonth,selectedYear)}",
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _faturamentoAnual.adicionarFaturamento(_yearMonth.getPreviousYear(i,selectedMonth,selectedYear), _yearMonth.getPreviousMonth(i,selectedMonth),
                            double.parse(monthControllers[i].text));

                      },
                    ),
                  ),
                ElevatedButton(onPressed: (){
                  boxFaturamentoDoze.put("faturamentoAnual",_faturamentoAnual.anos);
                  boxFaturamentoDoze.put("faturamentoMes",_faturamentoController.text);
                  print("Faturamento 1:${_faturamentoAnual.anos}");
                  print("Faturamento 2:${_faturamentoController.text}");
                }, child: const Text("Calcular"),),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void updateMonthControllers() {
    for (int i = 0; i < 12; i++) {
      monthControllers[i].text = "";
    }
  }

}

