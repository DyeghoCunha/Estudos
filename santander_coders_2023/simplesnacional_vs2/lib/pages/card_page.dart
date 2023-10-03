import 'package:flutter/material.dart';
import '../model/card_detail.dart';
import '../repositories/card_detail_repository.dart';
import '../widgets/cardModelo.dart';
import 'card_detail_page.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  Future<List<CardDetail>>? listCard;

  @override
  void initState() {
    super.initState();
    listCard = CardDetailRepository.get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CardDetail>>(
      future: listCard,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('Nenhum dado disponível');
        } else {
          return Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                    ? const AssetImage("assets/images/fundo1.png")
                    : const AssetImage("assets/images/fundo1d.png"),
                fit: BoxFit.cover
              ),
            ),
            child: ListView(
              children: snapshot.data!.map((card) {
                return CardModelo(cardDetail: card);
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
