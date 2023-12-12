import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/questionCustomBottomSheet.dart';

class BtnQuestion extends StatelessWidget {
  BtnQuestion({super.key, required this.texto, required this.titulo});

  String? texto;
  String? titulo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(1),
          clipBehavior: Clip.antiAlias,
          barrierColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          useSafeArea: true,
          showDragHandle: true,
          enableDrag: true,
          builder: (ctx) => QuestionCustomBottomSheet(
            texto: texto,
            titulo: titulo,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(), 
        padding: EdgeInsets.all(0)// Torna o botão redondo
      ),
      child: Ink(
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primary, // Cor de fundo do botão
          shape: const CircleBorder(), // Torna o fundo do botão redondo
        ),
        child: Icon(
          Icons.question_mark,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 20,
        ),
      ),
    );
  }
}
