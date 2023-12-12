import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/pages/Filtro.dart';
import 'package:flutter_cskinstore_v1/pages/OfertasPage.dart';
import 'package:flutter_cskinstore_v1/pages/SorteioPage.dart';
import 'package:flutter_cskinstore_v1/pages/TradePage.dart';
import 'package:flutter_cskinstore_v1/pages/testeWidgets.dart';
import 'package:flutter_cskinstore_v1/widget/CustomDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController = PageController(initialPage: 1);
  int posicaoPagina = 0;

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _mostrarBottomSheet() {
    showModalBottomSheet(
        context: context,
        elevation: 8,
        backgroundColor: const Color.fromRGBO(36, 38, 47, 1),
        showDragHandle: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        builder: (ctx) {
          return Filtro();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Adicione a chave global aqui
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(36, 38, 47, 1),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset("assets/images/logo.png"),
        ),
        leadingWidth: 150,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Color.fromRGBO(153, 153, 153, 1)),
            onPressed: _openDrawer,
          ),
        ],
      ),
      floatingActionButton: posicaoPagina == 1
          ? FloatingActionButton(
              onPressed: () {
                _mostrarBottomSheet();
              },
              elevation: 10,
              mini: true,
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: CircleBorder(
                side: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1),
              ),
              child: Icon(
                Icons.filter_alt,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(
                  () {
                    posicaoPagina = value;
                  },
                );
              },
              children: [
              SorteioPage(),
                TradePage(),
            OfertasPage(),
                Container(
                  color: Colors.teal,
                ),
              ],
            ),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      // Adicione o Drawer diretamente no Scaffold
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(245, 132, 1, 1),
        elevation: 8,
        unselectedItemColor: const Color.fromRGBO(153, 153, 153, 1),
        backgroundColor: const Color.fromRGBO(36, 38, 47, 1),
        currentIndex: posicaoPagina,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          pageController.jumpToPage(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department_sharp), label: "Para Você"),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz_sharp), label: "Trade"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Ofertas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
        ],
      ),
    );
  }
}
