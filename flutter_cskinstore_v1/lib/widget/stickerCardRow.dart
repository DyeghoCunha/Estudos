import 'package:flutter/material.dart';

import 'stickerCardItem.dart';

class StickerCardRow extends StatelessWidget {
   StickerCardRow({super.key,required this.stickerList});

List<StickerCardItem> stickerList;
  @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          width: double.infinity,
          height: 123,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stickerList.length, // Número de elementos
            itemBuilder: (BuildContext context, int index) {
              // Substitua pelo conteúdo do LabelTag
              return stickerList[index];
            },
          ),
        ),
      );
    }
  }
