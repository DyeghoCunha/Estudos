import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/PerfilUserCard.dart';
import 'package:flutter_cskinstore_v1/widget/fotoNomeCard.dart';
import 'package:flutter_cskinstore_v1/widget/infoContatoCard.dart';
import 'package:flutter_cskinstore_v1/widget/marketStatusCard.dart';
import 'package:flutter_cskinstore_v1/widget/userMainSettingsCard.dart';
import 'package:flutter_cskinstore_v1/widget/yourBalanceCard.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {

    TextStyle estilo = TextStyle(color: Colors.white, fontSize: 16);

    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: ListView(
        children:  [
          Text("Area Pessoal", style: estilo),
          FotoNomeCard(),
          YourBalanceCard(),
          Divider(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          MarketStatusCard(),
          Divider(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          UserMainSettingsCard(),
          Divider(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          PerfilUserCard(),
          Divider(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          InfoContatoCard(),
        ],
      ),
    );
  }
}
