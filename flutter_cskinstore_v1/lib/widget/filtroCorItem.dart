import 'package:flutter/material.dart';

class FiltroCorItem extends StatefulWidget {
  FiltroCorItem({
    Key? key,
    required this.isParametro,
    required this.titulo,
    required this.cor,
    required this.onTap, // Adicione uma função de callback
  }) : super(key: key);

   bool isParametro;
  final String titulo;
  final Color cor;
  final Function(bool) onTap; // Função de callback

  @override
  State<FiltroCorItem> createState() => _FiltroCorItemState();
}

class _FiltroCorItemState extends State<FiltroCorItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              setState(() {
                widget.isParametro = !widget.isParametro;
                widget.onTap(widget.isParametro); // Chame a função de callback com o novo valor
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [ Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border:Border.all(color: widget.isParametro? Theme.of(context).colorScheme.secondary:Colors
                      .transparent, width: 3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      widget.cor.withOpacity(0.2),
                      widget.cor..withOpacity(0.5),
                      widget.cor.withOpacity(1.0),
                    ],

                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
                Icon( Icons.check, size: 35,color: widget.isParametro? Colors.black:Colors.transparent,)
            ]
            ),
          ),
          const SizedBox(width: 5),
          Text(
            widget.titulo,
            style: TextStyle(
              color: widget.isParametro?Theme.of(context).colorScheme.secondary: Theme.of(context)
                  .colorScheme
                  .onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
