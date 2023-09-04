import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_flutter/pages/resultado_page.dart';
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
  double alturaSelecionada = 0.0;
  double? resultado;

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

  void toggleDance(bool newValue){
    setState(() => isDance!.value = newValue);
  }

  double calculaImc(double peso, double altura){
  return (peso / (altura * altura))*10000;
 }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
      ),
      body: riveArtboard == null
          ? const SizedBox()
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child:SfSlider(
                    activeColor: Colors.teal,
                    inactiveColor: Colors.cyan,
                    value: pesoSelecionado,
                    minorTicksPerInterval: 5,
                    interval: 50,
                    showTicks: true,
                    showLabels: true,
                    max: 250,
                    min: 0,
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
                          child: Rive(
                            artboard: riveArtboard!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SfSlider.vertical(
                            activeColor: Colors.teal,
                            inactiveColor: Colors.cyan,
                            value: alturaSelecionada,
                            minorTicksPerInterval: 5,
                            interval: 50,
                            showTicks: true,
                            showLabels: true,
                            max: 200,
                            min: 0,
                            onChanged: (value) {
                              setState(() {
                                alturaSelecionada = value;
                                toggleDance(true);
                              });
                            },
                          ),
                        ),
                      ],
                    )),
                 Expanded(
                  flex: 1,
                  child:  Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Container(
                    width: 300,
                     height: 100,
                     alignment: Alignment.center,
                      child: const Text(
                        "Selecione o seu Peso e Altura",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),]
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.cyan.shade50,borderRadius: BorderRadius
                        .circular(10)),
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
                            Text("${pesoSelecionado.round()}Kg",
                                style:const TextStyle(fontSize: 30, color: Colors.teal))
                          ],
                        ),
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
                            Text("${alturaSelecionada.round()}cm",
                                style:const TextStyle(fontSize: 30, color: Colors.teal))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.teal,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                       var resultado = calculaImc(pesoSelecionado, alturaSelecionada);
                       showModalBottomSheet(
                         elevation: 10,
                           showDragHandle: true,
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                           context: context, builder: (BuildContext ctx){
                         return Container(
                           color: Colors.white,
                             child: Expanded(
                               child: Column(
                           children: [
                               Text("O Seu IMC é:",style:const TextStyle(fontSize: 30, color: Colors.teal)),
                               Text("${resultado.roundToDouble()}",style:const TextStyle(fontSize: 30,
                                   color: Colors.cyan)),
                           ],
                         ),
                             ));
                       });
                        // Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ResultadoPage(resultado:
                        // resultado,)));
                      },
                      child: const Text(
                        "Calcular",
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                ),

              ],
            ));
}
