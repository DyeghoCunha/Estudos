import 'package:flutter/material.dart';

class InfoContatoCard extends StatelessWidget {
  const InfoContatoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "Informações de Contato",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(color: Colors.white),
                        ),
                        Wrap(
                          children: [
                            Text("exemplo@exemplo.com.br",style: TextStyle(color: Theme.of(context)
                                .colorScheme.onPrimary),),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Telefone",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("Não Adicionado",style: TextStyle(color: Theme.of(context).colorScheme
                            .onPrimary),),

                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        )
      ],
    );
  }
}
