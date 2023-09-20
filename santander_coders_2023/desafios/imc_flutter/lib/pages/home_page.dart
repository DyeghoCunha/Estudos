import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_flutter/controller/controller.dart';
import 'package:imc_flutter/pages/resultado_page.dart';
import 'package:imc_flutter/pages/user_page.dart';
import 'package:rive/rive.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Artboard? riveArtboard;
  SMIBool? isDance;
  SMITrigger? isLookUp;
  double pesoSelecionado = 0.0;
  double alturaSelecionada = 190.0;
  double? resultado;

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
      drawer:  Drawer(
        child: UserPage(),
      ),
      body: riveArtboard == null
          ? const SizedBox()
          : Container(
            child: ListView(
              children: [
                Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SfSlider(
                          activeColor: Colors.teal,
                          inactiveColor: Colors.cyan,
                          value: pesoSelecionado,
                          minorTicksPerInterval: 10,
                          interval: 10,
                          showTicks: true,
                          showLabels: true,
                          max: 130,
                          min: 60,
                          onChanged: (value) {
                            setState(() {
                              pesoSelecionado = value;
                              isLookUp?.value = true;
                              toggleDance(false);
                            });
                          },
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                // child: Rive(
                                //   artboard: riveArtboard!,
                                //   fit: BoxFit.cover,
                                // ),
                                child: Image.asset(
                                  "assets/images/dash.png",
                                  fit: BoxFit.contain,
                                ),
                              ),

                            ],
                          )),
                      Expanded(
                        flex: 1,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 300,
                                height: 100,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Selecione o seu Peso",
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
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
                                    "Altura: ",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${alturaSelecionada.round()}cm",
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
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
                      ),
                      Container(
                        color: Colors.teal,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            //var resultado = calculaImc(pesoSelecionado, alturaSelecionada);
                            var resultado = _imc.resultado(pesoSelecionado, alturaSelecionada);
                            print(alturaSelecionada);
                            print(pesoSelecionado);
                            print(resultado);
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
                                                child: Text("Ignorar"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: Text("Salvar Peso ?"),
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
                            // Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ResultadoPage(resultado:
                            // resultado,)));
                          },
                          child: const Text(
                            "Calcular",
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ));
}
