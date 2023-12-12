import 'package:flutter/material.dart';

class FiltroCheckBoxItem extends StatefulWidget {
FiltroCheckBoxItem({super.key, required this.isParametro, required this.titulo, required this.onTap});
  bool isParametro;
  Function onTap;
  String titulo;

  @override
  State<FiltroCheckBoxItem> createState() => _FiltroCheckBoxItemState();
}

class _FiltroCheckBoxItemState extends State<FiltroCheckBoxItem> {
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
                        .transparent, width: 2),
                   color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                  Icon( Icons.check, size: 35,color: widget.isParametro? Theme.of(context).colorScheme.secondary:Colors
                      .transparent,)
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
