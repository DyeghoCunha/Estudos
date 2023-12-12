import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show BuildContext, Card, Container, Row, State, StatefulWidget, Widget;
import 'package:flutter_cskinstore_v1/widget/CardPadrao.dart';

class CardPadraoRow extends StatefulWidget {
  const CardPadraoRow({super.key});


  @override
  State<CardPadraoRow> createState() => _CardPadraoRowState();
}

class _CardPadraoRowState extends State<CardPadraoRow> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: CardPadrao(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: CardPadrao(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: CardPadrao(),
          ),
        ),

      ],
    );
  }
}
