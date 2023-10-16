import 'package:flutter/material.dart';

class InputFaturamento extends StatefulWidget {
   InputFaturamento({super.key, required this.faturamentoController, required this.selectedMonth, required
   this.selectedYear});

  TextEditingController faturamentoController;
  String selectedMonth;
  int selectedYear;

  @override
  State<InputFaturamento> createState() => _InputFaturamentoState();
}

class _InputFaturamentoState extends State<InputFaturamento> {




  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.faturamentoController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Faturamento de ${widget.selectedMonth} de ${widget.selectedYear}",
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
