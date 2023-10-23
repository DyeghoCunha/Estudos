import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/database/empresas.dart';
import '../components/box_card.dart';
import '../model/EmpresaModel.dart';

class CardButton extends StatelessWidget {
  CardButton({
    super.key,
    required this.titulo,
    required this.icone,
    this.splashColor = Colors.green,
    this.empresa,
  });

  final IconData icone;
  final String titulo;
  final Color splashColor;
  Empresa? empresa;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
       print(empresa!);
       EmpresaDb().addEmpresa(empresa!);
      },
      splashColor: splashColor,
      borderRadius: BorderRadius.circular(8),
      child: BoxCard(
          boxContent: _CardButton(
        icon: Icon(
          icone,
          color: splashColor,
        ),
        text: titulo,
        color: splashColor,
      )),
    );
  }
}

class _CardButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final Color color;

  const _CardButton({
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: icon,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12, color: color),
          ),
        ],
      ),
    );
  }
}
