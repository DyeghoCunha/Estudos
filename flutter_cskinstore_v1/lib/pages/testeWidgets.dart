import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/pages/Filtro.dart';
import 'package:flutter_cskinstore_v1/pages/TradePage.dart';
import 'package:flutter_cskinstore_v1/pages/testeWidgets.dart';
import 'package:flutter_cskinstore_v1/widget/CustomDrawer.dart';

class HomePageTeste extends StatefulWidget {
  const HomePageTeste({Key? key}) : super(key: key);

  @override
  State<HomePageTeste> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTeste> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageController = PageController(initialPage: 1);
  int posicaoPagina = 1; // Inicialmente definido para "Trade"

  TabController? _tabController; // Adicione um TabController

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            posicaoPagina = value;
            if (posicaoPagina == 1) {
              // Quando estiver na página "Trade", ative a TabBar
              _tabController?.animateTo(0); // Defina a primeira guia ativa
            } else {
              _tabController?.animateTo(1); // Quando não estiver na página "Trade", defina a segunda guia ativa
            }
          });
        },
        children: [
          Container(
            color: Colors.red,
            child: Image.asset("assets/images/ParaVoce.jpeg", fit: BoxFit.contain),
          ),
          TradePage(),
          //TesteWidget(),
          Container(
            color: Colors.deepPurple,
          )
        ],
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(245, 132, 1, 1),
        elevation: 8,
        unselectedItemColor: const Color.fromRGBO(153, 153, 153, 1),
        backgroundColor: const Color.fromRGBO(36, 38, 47, 1),
        currentIndex: posicaoPagina,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          _pageController.jumpToPage(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department_sharp), label: "Para Você"),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz_sharp), label: "Trade"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Ofertas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
      // Adicionar a TabBar somente quando estiver em "Trade"
      bottomSheet: posicaoPagina == 1
          ? TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: 'Minhas Skins'),
          Tab(text: 'CSkins'),
        ],
      )
          : null,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose(); // Dispose do TabController
    super.dispose();
  }
}
