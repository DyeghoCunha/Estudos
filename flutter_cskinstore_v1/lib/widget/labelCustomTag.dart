import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/models/questionDb.dart';
import 'package:flutter_cskinstore_v1/widget/btnQuestion.dart';

import 'questionCustomBottomSheet.dart';

class LabelCustomTag extends StatelessWidget {
  LabelCustomTag({
    super.key,
    required this.texto,
    this.tradeLock = false,
    this.userItem = false,
    this.rare = false,
  });

  String texto;
  bool? tradeLock;
  bool? userItem;
  bool? rare;



  @override
  Widget build(BuildContext context) {

    Color cor = Colors.green;
    String titulo = "Skin Disponível";
    String? descricao = "TradeLock é uma restrição temporária que impede a capacidade de negociar ou vender skins "
        "compradas no jogo ou no Steam Marketplace. Se a skin bloqueada estiver em um bot da CSkin, ela poderá ser "
        "negociada em nosso site após o término do TradeLock. Após o término do TradeLock, o botão 'Retirar "
        "para o Steam' aparecerá no item";
    Icon icone =Icon(Icons.lock_open_outlined, color: cor);


    if(rare!){
      cor = Colors.deepPurple.shade100;
      descricao = "";
      titulo = "";
      icone =  Icon(Icons.attach_money,color: cor,);
    }else if(tradeLock!){
      cor = Colors.amber;
      icone = Icon(Icons.lock, color: cor,);
      titulo = "Bloqueio de negociação";
    } else if(userItem!){
      cor = Colors.redAccent;
      icone = Icon(Icons.person, color: cor,);
      titulo = "Item de Usuario";
      descricao = "O preço desta skin foi definido pelo seu proprietário, o item não pertence ao bot da CSkin. "
          "Você esta comprando de outro usuário";
    }

    return Row(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: cor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [

              const SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    icone,
                    const SizedBox(width: 2,),
                    Text(
                      texto,
                      style: TextStyle(
                        fontSize: 20,
                        color: cor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if(rare! == false)
               ElevatedButton(
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
            texto: descricao,
            titulo: titulo,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: cor.withOpacity(0.3),
          padding: EdgeInsets.all(0)// Torna o botão redondo
      ),
      child: Ink(
        decoration: const ShapeDecoration(
          shape: CircleBorder(), // Torna o fundo do botão redondo
        ),
        child: Icon(
          Icons.question_mark,
          color: cor,
          size: 20,
        ),
      ),
    )
              else const SizedBox(width: 5,)
            ],
          ),
        ),
        SizedBox(width: 5,)
      ],
    );
  }
}
