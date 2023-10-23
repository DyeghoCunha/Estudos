import 'package:flutter/material.dart';

import '../model/EmpresaModel.dart';
import '../service/utilidades.dart';

class ListTileEmpresa extends StatelessWidget {
  ListTileEmpresa({super.key, required this.empresa});

  Empresa empresa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
      child: Card(
        elevation: 8,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [
              Colors.green.shade300.withOpacity(0.7),
                  Colors.green.shade700.withOpacity(0.7)
            ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
            color: Colors.green,
          ),
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.center,

            isThreeLine: true,
            title: Text(Utilidades.primeiraMaiuscula(empresa.nomeFantasia ?? "")),
            subtitle: Text("CNPJ: ${Utilidades.formatarCNPJ(empresa.cnpj ?? "")}"
                "\nPorte: ${Utilidades.primeiraMaiuscula(empresa.porteDaEmpresa ?? "")}"),
            trailing: PopupMenuButton<String>(
              elevation: 10,
              onSelected: (menu) {
                print(menu);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              itemBuilder: (BuildContext ctx) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "Principal",
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Principal")
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: "Editar",
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Editar")
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: "Deletar",
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Lixo")
                      ],
                    ),
                  ),
                ];
              },
            ),
          ),
        ),
      ),
    );
    ;
  }
}
