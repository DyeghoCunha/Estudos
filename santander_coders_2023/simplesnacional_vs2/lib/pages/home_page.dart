import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import 'card_page.dart';
import 'list_view_h.dart';
import 'listaDeTarefas.dart';
import 'dados_cadastrais.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Simples Nacional"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      posicaoPagina = value;
                    });
                  },
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/fundo4.png",
                              ),
                              fit: BoxFit.cover)),
                    ),
                    const CardPage(),
                     ListViewH(),
                    ListaDeTarefas(),
                  ]),
            ),
            BottomNavigationBar(
              currentIndex: posicaoPagina,
              onTap: (value) {
                pageController.jumpToPage(value);
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: "Leia"),
                BottomNavigationBarItem(icon: Icon(Icons.linear_scale_sharp), label: "Simule"),
                BottomNavigationBarItem(icon: Icon(Icons.leaderboard_rounded), label: "Entenda"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
