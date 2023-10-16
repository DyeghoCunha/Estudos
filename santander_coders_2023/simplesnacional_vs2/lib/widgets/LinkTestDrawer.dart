import 'package:flutter/material.dart';

class LinkTestDrawer extends StatelessWidget {
  LinkTestDrawer({super.key, required this.titulo, required this.pagina});

  String titulo;
  Widget pagina;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => pagina));
          },
          child: Row(
            children: [
              Icon(Icons.text_snippet, color: Colors.red.withOpacity(0.5),),
              const SizedBox(
                width: 10,
              ),
              Text(
                titulo,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ],
          ),
        ),  DividerTheme(
            data: DividerThemeData(
              color: Theme.of(context).colorScheme.primary,
              thickness: 1,
            ),
            child: const Divider()),
      ],
    );
  }
}
