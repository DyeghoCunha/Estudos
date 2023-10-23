import 'package:flutter/material.dart';

class CartaoDrawer extends StatelessWidget {
  CartaoDrawer({super.key});

  final Widget teste = UserAccountsDrawerHeader(
    currentAccountPicture: CircleAvatar(
      radius: 40,
      backgroundImage: const AssetImage("assets/images/fundo0.png"),
      child: Icon(Icons.person,size: 60, color: Colors.green.withOpacity(0.6),),
    ),
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
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
    ),
    accountName: const Text("Dyegho Cunha"),
    accountEmail: const Text("email@email.com"),
  );
  final Widget teste2 = Container(
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
    child: const Column(
      children: [],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return teste;
  }
}
