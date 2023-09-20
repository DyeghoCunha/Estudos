import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatorios extends StatefulWidget {
  const NumerosAleatorios({super.key});

  @override
  State<NumerosAleatorios> createState() => _NumerosAleatoriosState();
}

class _NumerosAleatoriosState extends State<NumerosAleatorios> {
  int? numeroGerado = 0;
  final chaveNumeroAleatorio = "numero_aleatorio";
  final chaveQuantidade = "quantidade";
  final chaveListaNumeros = "lista";
  int? quantidade;
  List<String>? listaDeNumeros = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    final  storage = await SharedPreferences.getInstance();

    setState(() {
      numeroGerado = storage.getInt(chaveNumeroAleatorio);
      quantidade = storage.getInt(chaveQuantidade);
      listaDeNumeros = storage.getStringList(chaveListaNumeros);
    });
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.teal.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("O Número Gerado foi:", style: TextStyle(color: Colors.cyan,fontSize: 20, fontWeight:
            FontWeight.bold),),
            const SizedBox(height: 20,),
            Text(numeroGerado?.toString() ?? "Sem Número Gerado", style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w500, color: Colors.teal),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(listaDeNumeros?.toString() ?? "Nenhum número gerado ainda", style:const  TextStyle(color: Colors.cyan,fontSize: 20, fontWeight:
                  FontWeight.bold),),
                ),
              ),
            ),
            Text(quantidade?.toString() ?? "Nenhum número gerado ainda", style:const  TextStyle(color: Colors.cyan,
                fontSize: 20, fontWeight:
                FontWeight.bold),),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async  {
          final storage = await SharedPreferences.getInstance();
          var random = Random();
          setState(() {
            numeroGerado = random.nextInt(100);
            if(numeroGerado != null){
              listaDeNumeros?.add(numeroGerado!.toString());
              if (listaDeNumeros != null) {
                quantidade = listaDeNumeros!.length;
              }
            }
          });
          storage.setInt(chaveNumeroAleatorio, numeroGerado!);
          storage.setInt(chaveQuantidade, quantidade!);
          storage.setStringList(chaveListaNumeros, listaDeNumeros!);
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
