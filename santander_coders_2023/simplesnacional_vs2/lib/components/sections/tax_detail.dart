import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/box_card.dart';
import 'package:simplesnacional_vs2/components/color_dot.dart';
import 'package:simplesnacional_vs2/components/content_division.dart';
import 'package:simplesnacional_vs2/themes/theme_colors.dart';

class TaxDetail extends StatelessWidget {
  const TaxDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16,top: 16),
                child: Text("Detalhes do Imposto", style: Theme.of(context).textTheme.titleMedium,),
              ),
              const BoxCard(boxContent: _taxDetail()),
            ],
          ),
        ],
      ),
    );
  }
}


class _taxDetail extends StatelessWidget {
  const _taxDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const  Text("Simples Nacional:",style: TextStyle(
          color: ThemeColors.cinza
        ),),
        Text("\$5.940,06", style: Theme.of(context).textTheme.bodyLarge,),
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 8.0),
         child: const ContentDivision(),
       ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: const Text("Federais:", style: TextStyle(color: ThemeColors.cinza),),
        ),
        _Imposto(imposto: "IR", valor: "1.300,00", cor: Colors.redAccent),
        _Imposto(imposto: "CSLL", valor: "830,00", cor: Colors.red),
        _Imposto(imposto: "CPP", valor: "300,00", cor: Colors.orange),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: const Text("Estaduais:", style: TextStyle(color: ThemeColors.cinza),),
        ),
        _Imposto(imposto: "ICMS", valor: "2.450,00", cor: Colors.yellowAccent ),

     ]
    );
  }
}

class _Imposto extends StatelessWidget {
  String imposto;
  String valor;
  Color cor;

  _Imposto({super.key, required this.imposto, required this.valor, required this.cor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.zero,
      titleAlignment: ListTileTitleAlignment.center,
      visualDensity: VisualDensity.comfortable,
      minLeadingWidth: 1,
      minVerticalPadding: 0,
      horizontalTitleGap: 10,
      splashColor: cor,
      onTap: (){},
      leading: ColorDot(color: cor),
      title: Text(imposto,style: TextStyle(fontSize: 12,color: ThemeColors.cinza),),
      subtitle: Text("R\$ $valor"),
      trailing: Icon(Icons.question_mark, color: ThemeColors.cinza.withOpacity(0.2),),
    );
  }
}
