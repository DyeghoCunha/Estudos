import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/models/questionDb.dart';

import 'btnQuestion.dart';

class CustomCardPriceItem extends StatelessWidget {
  CustomCardPriceItem({
    super.key,
    required this.defaultPrice,
    this.rareFloat,
    this.userMarkup,
    this.rareSticker
  });

  String defaultPrice;
  String? userMarkup;
  String? rareFloat;
  String? rareSticker;


  @override
  Widget build(BuildContext context) {

    String? defaultPriceDetail = questionDb["defaultPriceDetail"];
    String? userMarkupDetail = questionDb["userMarkupDetail"];
    String? rareFloatDetail = questionDb["rareFloatDetail"];
    String? rareStickerDetail = questionDb["rareStickerDetail"];

    if(defaultPriceDetail==null || userMarkupDetail==null || rareFloatDetail==null||
        rareStickerDetail==null){
      defaultPriceDetail = "nl";
      userMarkupDetail = "nl";
      rareFloatDetail = "nl";
      rareStickerDetail = "nl";
    }


    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Detalhamento de valores",style: TextStyle(color: Colors.white,fontSize: 20,
                fontWeight: FontWeight.w500),),
          ),
          if(defaultPrice.length>2)
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Preço Padrão",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
                  ),
                  Row(
                    children: [
                       Text(
                        "R\$ $defaultPrice",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      BtnQuestion(texto: defaultPriceDetail, titulo: "Preço Padrão"),
                    ],
                  ),
                ],
              ),
            ),
          if(userMarkup!.length>2)
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "User MarkUp",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        "R\$ $userMarkup",
                       style:const TextStyle(color: Colors.redAccent, fontSize: 20),
                      ),
                      BtnQuestion(texto: userMarkupDetail, titulo: "User MarkUp"),
                    ],
                  ),
                ],
              ),
            ),
          if(rareFloat!.length>2)
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rare Float",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        "R\$ $rareFloat",
                        style: TextStyle(color: Colors.deepPurple.shade300, fontSize: 20),
                      ),
                      BtnQuestion(texto: rareFloatDetail, titulo: "Rare Float"),
                    ],
                  ),
                ],
              ),
            ),
          if(rareSticker!.length>2)
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rare Stickers",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        "R\$ $rareSticker",
                        style: TextStyle(color: Colors.deepPurple.shade300, fontSize: 20),
                      ),
                      BtnQuestion(texto: rareStickerDetail, titulo: "Rare Stickers"),
                    ],
                  ),
                ],
              ),
            ),



        ],
      ),
    );
  }
}
