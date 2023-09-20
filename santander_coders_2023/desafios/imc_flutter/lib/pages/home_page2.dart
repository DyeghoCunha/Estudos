import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_flutter/controller/controller.dart';
import 'package:imc_flutter/pages/user_page.dart';
import 'package:imc_flutter/widget/linearProgressIndicatorCustom.dart';
import 'package:rive/rive.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key});

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  Artboard? riveArtboard;
  SMIBool? isDance;
  SMITrigger? isLookUp;
  double pesoSelecionado = 0.0;
  double alturaSelecionada = 190.0;
  TextEditingController pesoController = TextEditingController();
  final CalculaImc _imc = CalculaImc();

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive/dash.riv').then(
          (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller = StateMachineController.fromArtboard(artboard, 'birb');
          if (controller != null) {
            artboard.addController(controller);
            isDance = controller.findSMI('dance');
            isLookUp = controller.findSMI('look up');
          }
          setState(() => riveArtboard = artboard);
        } catch (e) {
          print(e);
        }
      },
    );
  }

  void toggleDance(bool newValue) {
    setState(() => isDance!.value = newValue);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Calculadora de IMC'),
      centerTitle: true,
    ),
    drawer: Drawer(
      child: UserPage(),
    ),
    body: riveArtboard == null
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : SingleChildScrollView(
      child: Container(
        color: Colors.teal,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: pesoController,
                decoration: const InputDecoration(
                  floatingLabelStyle: TextStyle(color: Colors.cyanAccent),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.cyanAccent,
                    ),
                  ),
                  hintText: "Qual o seu Peso Hoje ?",
                  label: Text(
                    "Peso",
                    style: TextStyle(
                      // color: Colors.teal,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.cyanAccent,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    "assets/images/dash.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: const Text(
                "Selecione o seu Peso",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Peso: ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${pesoSelecionado.round()}Kg",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          LinearProgressIndicatorCustom() ,
            const SizedBox(
              height: 10,
            ),

            Container(
              color: Colors.teal,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Atualize o progresso com base nos pontos ganhos.

                  var resultado = _imc.resultado(pesoSelecionado, alturaSelecionada);
                  showModalBottomSheet(
                    elevation: 10,
                    barrierColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    context: context,
                    builder: (BuildContext ctx) {
                      return Wrap(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                const Text(
                                  "O Seu IMC é:",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.teal,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${resultado.roundToDouble()}",
                                  style: const TextStyle(
                                    fontSize: 40,
                                    color: Colors.cyan,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "E você está ${_imc.faixaImc(resultado)}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.teal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text("Ignorar"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Salvar Peso ?"),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),

                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),

          ],
        ),
      ),
    ),
  );
}
