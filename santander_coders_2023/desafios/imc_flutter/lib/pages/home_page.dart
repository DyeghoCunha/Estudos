import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: riveArtboard == null
          ? const SizedBox()
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: Colors.red,
                    child: Text("Selecione o seu Peso e Altura"),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
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
                              value: pesoSelecionado,
                              minorTicksPerInterval: 5,
                              interval: 50,
                              showTicks: true,
                              showLabels: true,
                              max: 200,
                              min: 0,
                              onChanged: (value) {
                                setState(() {
                                  pesoSelecionado = value;
                                  toggleDance(true);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.purple,
                      width: double.infinity,
                      child: ElevatedButton(
                          child: const Text(''),
                          onPressed: () {
                            isLookUp?.value = true;
                            toggleDance(false);
                          }),
                    ))
              ],
            ));
}
