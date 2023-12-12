import 'package:flutter/material.dart';


class PerfilUserCard extends StatelessWidget {
  const PerfilUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "Perfil",
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
                          "Comissão",
                          style: TextStyle(color: Colors.white),
                        ),
                       Wrap(
                          children: [
                            Text("7%",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
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
                          "Data de Registro",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("06.09.2023",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),

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
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Negociações",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("0",style: TextStyle(color: Colors.white),),

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
