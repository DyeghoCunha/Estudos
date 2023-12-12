import 'package:flutter/material.dart';

class CardPadraoStickers extends StatefulWidget {
   CardPadraoStickers({super.key, required this.stickerNumber});
   String stickerNumber;

  @override
  State<CardPadraoStickers> createState() => _CardPadraoStickersState();
}

class _CardPadraoStickersState extends State<CardPadraoStickers> {
  @override
  Widget build(BuildContext context) {

    String sticker = widget.stickerNumber;

    return  Container(
       color: Colors.transparent,
        width: 15,
        height: 15,
        child: Image.asset("assets/sticker/$sticker.png"),
    );
  }
}
