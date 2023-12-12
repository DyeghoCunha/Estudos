import 'package:flutter/material.dart';

class OfertasPage extends StatelessWidget {
  const OfertasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ofertas",style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/icone2.png",fit: BoxFit.fill,),
          const SizedBox(height: 40,),
          const Text("Não existem ofertas ativas no momento",style: TextStyle(color: Colors.white,fontSize:
          20),),
          const SizedBox(height: 20,),
          Text("Coloque seu item à venda no modo Mercado no CSkinStore. Quando um comprador aparecer, nós "
              "notificaremos você.",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 15),textAlign: TextAlign.center,),
          
        ],
      ),
    );
  }
}
