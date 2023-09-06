import 'package:flutter/material.dart';

class ListViewH extends StatelessWidget {
  ListViewH({super.key});

  Widget cardTeste = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
    child: Card(
      elevation: 8,
      color: Colors.green.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color:Colors.transparent ),
        child:  ListTile(
          leading: Image.asset("assets/images/logo2.png"),
          title: const Text("Simples Nacional"),
          subtitle: const Text("Simule o cálculo da sua guia"),
          trailing: PopupMenuButton<String>(
            elevation: 10,
            onSelected: (menu){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            itemBuilder: (BuildContext ctx){
              return <PopupMenuEntry<String>>[
              const  PopupMenuItem<String>(
                    value: "teste1",
                    child:Text("Teste 1")),
                const  PopupMenuItem<String>(
                    value: "teste2",
                    child:Text("Teste 2")),
                const  PopupMenuItem<String>(
                    value: "teste3",
                    child:Text("Teste 3")),
                const  PopupMenuItem<String>(
                    value: "teste4",
                    child:Text("Teste 4")),
              ];
            },
          ),
        ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/fundo3.png"), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [

            cardTeste,
            cardTeste,
            cardTeste,
            cardTeste,
            cardTeste,
          ],
        ));
  }
}
