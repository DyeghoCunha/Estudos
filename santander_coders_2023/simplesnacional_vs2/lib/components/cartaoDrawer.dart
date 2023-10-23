import 'package:flutter/material.dart';

class CartaoDrawer extends StatelessWidget {
  CartaoDrawer({super.key});

  Widget teste = UserAccountsDrawerHeader(
    currentAccountPicture: Image.asset("assets/images/logo.png"),
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/fundoVerde.png"), fit: BoxFit.cover),
      boxShadow: [
        BoxShadow(
          color: Colors.grey, // Cor da sombra
          offset: Offset(4, 4), // Deslocamento para a sombra superior-esquerda
          blurRadius: 4, // Raio do desfoque da sombra
        ),
        BoxShadow(
          color: Colors.white, // Cor da sombra interna
          offset: Offset(-4, -4), // Deslocamento para a sombra inferior-direita
          blurRadius: 4, // Raio do desfoque da sombra
        ),
      ],
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
    ),
    otherAccountsPictures: [Image.asset("assets/images/logo.png"), Image.asset("assets/images/logo.png")],
    arrowColor: Colors.red,
    accountName: const Text("Dyegho Cunha"),
    accountEmail: const Text("email@email.com"),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage("assets/images/fundoVerde.png"), fit: BoxFit.cover),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(8),
        ),
        boxShadow: kElevationToShadow[2],
      ),
      child:const Column(
        children: [
          
        ],
      ),
    );
  }
}
