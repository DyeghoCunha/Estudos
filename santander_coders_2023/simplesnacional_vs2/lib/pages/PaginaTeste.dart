import 'package:flutter/material.dart';
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
    return ListView(
      shrinkWrap: true,
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
                leading: Icon(
                  Icons.calculate_outlined,
                  color: Colors.green,
                  size: 40,
                ),
                title: Text("Calcule o Simples Nacional"),
                subtitle: Text("Digite os valores"),
              ),
              Divider(
                height: 0,
                color: Colors.green,
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 1), // Green border
                  borderRadius: BorderRadius.circular(8),

                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 Container(
                   width: 40,
                   height: 40,
                   color: Colors.green,
                 ),
                    DropdownButton(
                      value: selectedAnexo,
                      elevation: 10,
                      items: anexos.map((anexo) {
                        return DropdownMenuItem(
                          child: Text(anexo),
                          value: anexo,
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
                      effectiveTaxRate = aliquota.funcCalculaAliqEfetiva(double.tryParse(brt12Controller.text) ??
                          0.0, selectedAnexo ?? "Anexo I") ?? 0.0;
                    });
                  },
                  child: Text("Calcule"),
                ),
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.green,
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
              ),
            const SizedBox(height: 40,),
            ],
          ),
        ),
      ],
    );
  }
}
