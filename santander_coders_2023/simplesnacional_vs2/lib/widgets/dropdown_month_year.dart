import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/service/yearMonth.dart';

class DropDownMonthYear extends StatefulWidget {
  DropDownMonthYear({super.key, required this.selectedYear, required this.selectedMonth, required
  this.monthControllers});

  String selectedMonth;
  int selectedYear;
  List monthControllers;

  @override
  State<DropDownMonthYear> createState() => _DropDownMonthYearState();
}


class _DropDownMonthYearState extends State<DropDownMonthYear> {
  List<int> years = yearMonth.years;
  List<String> months = yearMonth.months;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Dropdown para selecionar o ano
          DropdownButton<int>(
            value: widget.selectedYear,
            onChanged: (int? newValue) {
              setState(() {
                widget.selectedYear = newValue!;
              });
            },
            items: years.map((int year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(year.toString()),
              );
            }).toList(),
          ),
          const SizedBox(width: 16), // Espaço entre os Dropdowns
          // Dropdown para selecionar o mês
          DropdownButton<String>(
            value: widget.selectedMonth,
            onChanged: (String? newValue) {
              setState(() {
                widget.selectedMonth = newValue!;
                widget.selectedYear = DateTime
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
    );
  }

  void updateMonthControllers() {
    for (int i = 0; i < 12; i++) {
      widget.monthControllers[i].text = "";

    }
  }
}

