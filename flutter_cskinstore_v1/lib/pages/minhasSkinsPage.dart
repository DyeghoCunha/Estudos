import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/searchBar.dart';

class MinhasSkinsPage extends StatelessWidget {
  const MinhasSkinsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarCustom(),
        Expanded(
          child: ListView(
            children: [

              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 120),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75), // Define o raio para tornar as bordas redondas
                  child: Image.network(
                    "https://media.tenor.com/y9SqR9fxWtwAAAAd/steam.gif",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "O seu inventário na Steam está privado",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Enquanto o seu perfil e inventário na Steam estão privados, ninguém pode ver os seus itens "
                        "ou te enviar uma oferta de troca. Para acessar o Mercado, altere o perfil para Público",
                        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Abrir a Steam",
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
