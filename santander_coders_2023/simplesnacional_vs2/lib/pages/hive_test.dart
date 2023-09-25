import 'package:flutter/material.dart';

import '../model/faturamentoAnualModel.dart';


class HiveTest extends StatefulWidget {
  const HiveTest({Key? key}) : super(key: key);

  @override
  State<HiveTest> createState() => _HiveTestState();
}

class _HiveTestState extends State<HiveTest> {
  TextEditingController _faturamentoController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  List<int> years = List.generate(DateTime
      .now()
      .year - 2017, (index) => 2018 + index);
  List<String> months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  final faturamentoAnual = FaturamentoAnual(anos: {});
  int selectedYear = DateTime
      .now()
      .year;
  String selectedMonth = 'Janeiro';
  List<TextEditingController> monthControllers = [];

  @override
  void initState() {
    super.initState();
    // Inicialize os controllers para os 12 meses anteriores
    for (int i = 0; i < 12; i++) {
      monthControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simples Nacional'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/fundo3.png"),fit: BoxFit.cover)
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              onTap: () {
                print(faturamentoAnual.anos);
              },
              subtitle: Text("Selecione o mês e ano que dejesa apurar o imposto"),
              title: Text("Selecione a referência"),
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
                    items: years.map((int year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text(year.toString()),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 16), // Espaço entre os Dropdowns
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
                    items: months.map((String month) {
                      return DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.green,),
            ListTile(
              onTap: () {

              },
              subtitle: Text("É com este faturamento que será calculado o imposto"),
              title: Text("Digite o Faturamento do mês atual"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _faturamentoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Faturamento de ${selectedMonth} de ${selectedYear}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Divider(color: Colors.green,),
            ListTile(
              onTap: () {
                print(faturamentoAnual.anos);
              },
              subtitle: Text("Para podermos calcular a sua alíquota"),
              title: Text("Informe o Faturamento dos últimos 12 meses"),
            ),
            for (int i = 0; i < 12; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: monthControllers[i],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Faturamento de ${getPreviousMonth(i)} de ${getPreviousYear(i)}",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    faturamentoAnual.adicionarFaturamento(getPreviousYear(i), getPreviousMonth(i),
                        double.parse(monthControllers[i].text));
                  },
                ),
              ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }

  // Função para obter o nome do mês anterior
  String getPreviousMonth(int index) {
    final currentMonthIndex = months.indexOf(selectedMonth);
    int previousMonthIndex = (currentMonthIndex - index - 1) % 12;

    // Ajuste para considerar anos diferentes
    if (previousMonthIndex < 0) {
      previousMonthIndex += 12;
    }

    return months[previousMonthIndex];
  }

  // Função para obter o ano anterior
  int getPreviousYear(int index) {
    final currentMonthIndex = months.indexOf(selectedMonth);
    final currentYear = selectedYear;
    int year = currentYear;

    // Ajuste para considerar anos diferentes
    if (currentMonthIndex - index <= 0) {
      year--;
    }

    return year;
  }

  void updateMonthControllers() {
    for (int i = 0; i < 12; i++) {
      monthControllers[i].text = "";
    }
  }

}

