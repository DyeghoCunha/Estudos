import 'package:flutter/material.dart';

import '../model/card_detail.dart';
import '../pages/card_detail_page.dart';



class CardModelo extends StatelessWidget {
  const CardModelo({super.key, required this.cardDetail});

  final CardDetail cardDetail;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => CardDetailPage(cardDetail: cardDetail),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Hero(
          tag: cardDetail.id,
          child: Card(
            elevation: 20,
            surfaceTintColor: Colors.blue,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const AssetImage("assets/images/fundo3.png"),
                      child: Image.asset(cardDetail.url)),
                ),
                Expanded(
                  child: Text(
                    cardDetail.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
