import 'dart:io';
import 'package:flutter/material.dart';

class AutenticaXMLNFCe extends StatefulWidget {
  const AutenticaXMLNFCe({super.key});

  @override
  State<AutenticaXMLNFCe> createState() => _AutenticaXMLNFCeState();
}

class _AutenticaXMLNFCeState extends State<AutenticaXMLNFCe> {
  TextEditingController origemController = TextEditingController();
  TextEditingController destinoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
var um = 'C:\\Users\\We\\Desktop\\Estrela\\negado';
var dois = 'C:\\Users\\We\\Desktop\\Estrela\\autorizada';
final List<String> nomesArquivos = [];

   void autentica(String setOrigem, String setDestino) {
       String origem = setOrigem;
       String destino = setDestino;
       origem = origem.replaceAll('\\', '\\\\');
       destino = destino.replaceAll('\\', '\\\\');

      final List<File> arquivos = Directory(origem).listSync().whereType<File>().toList();

      for (final File arquivo in arquivos) {
        final String conteudo = arquivo.readAsStringSync();
        final String conteudoModificado = conteudo.replaceAll(
            '<cStat>301</cStat><xMotivo>Uso Denegado : Irregularidade fiscal do emitente</xMotivo></infProt></protNFe></nfeProc>',
            '<cStat>100</cStat><xMotivo>Autorizado o uso da NF-e</xMotivo></infProt></protNFe></nfeProc>');
        nomesArquivos.add(arquivo.path
            .split('\\')
            .last);
        File('${destino}\\${arquivo.path
            .split('\\')
            .last}').writeAsStringSync(conteudoModificado);
      }
    }


    return ListView(
      children: [
        Container(
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fundoSimplesNacional.png"),
            )
          ),
          child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                     keyboardType: TextInputType.name,
                     decoration: const InputDecoration(
                       hintText: "Caminho de Origem dos Arquivos",
                       border: OutlineInputBorder(),
                       label: Text("Origem"),
                     ),
                     controller: origemController,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                     keyboardType: TextInputType.name,
                     decoration: const InputDecoration(
                       hintText: "Caminho de Destino dos Arquivos",
                       border: OutlineInputBorder(),
                       label: Text("Destino"),
                     ),
                     controller: destinoController,
                   ),
                 ),

                ElevatedButton(onPressed: (){
                  autentica(origemController.text, destinoController.text);
                }, child: Text("Autenticar")),

                SizedBox(
                  child: Container(
                    width: double.infinity,
                    height: 400,
                      child: ListView(
                        children: [
                          for(var xml in nomesArquivos)
                            Text(xml),
                        ],
                      ),
                  ),
                )
               ],
          ),
        )
      ],
    );
  }
}




