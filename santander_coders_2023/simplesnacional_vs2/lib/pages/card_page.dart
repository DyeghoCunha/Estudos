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
            decoration:const  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/fundoDrawer.png",
                ),
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
