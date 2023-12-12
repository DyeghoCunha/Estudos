import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/labelCustomRow.dart';
import 'package:flutter_cskinstore_v1/widget/stickerCardItem.dart';
import 'package:flutter_cskinstore_v1/widget/stickerCardRow.dart';

class StickerCard extends StatelessWidget {
  const StickerCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<StickerCardItem> listaDeSticker = [
    StickerCardItem(),
      StickerCardItem(),
      StickerCardItem(),
      StickerCardItem(),
    ];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stikers",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
                  ),
                  Text(
                    listaDeSticker.length.toString(),
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
                  ),
                ],
              ),
            ),
            StickerCardRow(stickerList: listaDeSticker)
          ],
        ),
      ),
    );
  }
}
