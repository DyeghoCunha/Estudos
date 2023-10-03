import 'package:flutter/material.dart';

import '../model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({super.key, required this.cardDetail});

  final CardDetail cardDetail;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text(cardDetail.title)),
          body: Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                    ? const AssetImage("assets/images/fundo0.png")
                    : const AssetImage("assets/images/fundo0d.png"),
                fit: BoxFit.cover
              ),
            ),
            child: ListView(
              children: [Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(cardDetail.url),fit:
                    BoxFit.fitWidth),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: Expanded(child: Text(cardDetail.text, style: TextStyle(color: Theme.of(context)
                            .colorScheme.onBackground),)),
                  )

                ],
              )],
            ),
          ),
        ),
      ),
    );
  }
}
