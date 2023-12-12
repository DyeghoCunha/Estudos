import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/userMainSettingsCardCustomRow.dart';

class UserMainSettingsCard extends StatelessWidget {
  const UserMainSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "Principal",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 18
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            child: Column(
              children: [
                UserMainSettingsCardCustomRow(icone: Icons.refresh, texto: "Transações"),
                Divider(
                 thickness: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                UserMainSettingsCardCustomRow(icone: Icons.settings, texto: "Settings"),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                UserMainSettingsCardCustomRow(icone: Icons.contact_support, texto: "Suporte"),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                UserMainSettingsCardCustomRow(icone: Icons.remove_red_eye, texto: "Estatus do Item")
              ],
            ),
          ),
        )
      ],
    );
  }
}
