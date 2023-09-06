import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatorios extends StatefulWidget {
  const NumerosAleatorios({super.key});

  @override
  State<NumerosAleatorios> createState() => _NumerosAleatoriosState();
}

class _NumerosAleatoriosState extends State<NumerosAleatorios> {
  int? numeroGerado;
  final chaveNumeroAleatorio = "numero_aleatorio";
  final chaveQuantidade = "quantidade";
  final chaveListaNumeros = "lista";
  int? quantidade;
  List<String>? listaDeNumeros;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async{
    final  storage = await SharedPreferences.getInstance();

    setState(() {
      numeroGerado = storage.getInt(chaveNumeroAleatorio);
      quantidade = storage.getInt(chaveQuantidade);
      listaDeNumeros = storage.getStringList(chaveListaNumeros);
    });
  //  storage.getInt(chaveNumeroAleatorio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("O Número Gerado foi:", style: TextStyle(color: Colors.cyan,fontSize: 20, fontWeight:
            FontWeight.bold),),
            const SizedBox(height: 20,),
            Text(numeroGerado ==null ? "Sem Numero Gerado": numeroGerado.toString(), style: const TextStyle
              (fontSize: 60,
                fontWeight: FontWeight
                .w500,
                color:
            Colors.teal),),
            Text(listaDeNumeros.toString(), style:const  TextStyle(color: Colors.cyan,fontSize: 20, fontWeight:
            FontWeight.bold),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async  {
          final storage = await SharedPreferences.getInstance();
          var random = Random();

          setState(() {
            numeroGerado = random.nextInt(1000);
            if(numeroGerado != null){
              listaDeNumeros?.add(numeroGerado!.toString());
               quantidade = listaDeNumeros?.length;
            }
          });
          storage.setInt(chaveNumeroAleatorio, numeroGerado!);
          storage.setInt(chaveQuantidade, quantidade!);
          storage.setStringList(chaveListaNumeros, listaDeNumeros!);
          print(quantidade);
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
