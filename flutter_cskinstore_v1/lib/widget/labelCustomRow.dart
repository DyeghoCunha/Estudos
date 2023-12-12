import 'package:flutter/material.dart';

import 'labelCustomTag.dart';

class LabelCustomRow extends StatelessWidget {
  LabelCustomRow({super.key, required this.labelTag});
  List labelTag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: labelTag.length, // Número de elementos
          itemBuilder: (BuildContext context, int index) {
            // Substitua pelo conteúdo do LabelTag
            return labelTag[index];
          },
        ),
      ),
    );
  }
}
