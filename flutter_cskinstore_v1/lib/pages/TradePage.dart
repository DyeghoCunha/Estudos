import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/pages/minhasSkinsPage.dart';
import 'package:flutter_cskinstore_v1/widget/CardPadraoRow.dart';

class TradePage extends StatelessWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // Número de abas
        child: Scaffold(
          appBar: AppBar(
            title:null,
            bottom: PreferredSize(
              preferredSize:const Size.fromHeight(0.0), // Altura personalizada da TabBar
              child: TabBar(
                indicatorWeight: 1.5,
                labelColor: Theme.of(context).colorScheme.secondary,
                unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
                tabs: const [
                  Tab(text: 'CSkin'),
                  Tab(text: 'Minhas Skins'),
                ],
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            color: const Color.fromRGBO(36, 38, 47, 1),
            child: TabBarView(
              children: [
                // Conteúdo da primeira página
                Center(
                  child: ListView(
                    children: const [
                      CardPadraoRow(),
                      CardPadraoRow(),
                      CardPadraoRow(),
                      CardPadraoRow(),
                      CardPadraoRow(),
                      CardPadraoRow(),
                      CardPadraoRow(),

                    ],
                  )
                ),
                // Conteúdo da segunda página
               const Center(
                  child:MinhasSkinsPage(),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
