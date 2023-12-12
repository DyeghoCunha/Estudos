import 'package:flutter/material.dart';

class FiltroCustom extends StatefulWidget {
  FiltroCustom({super.key, required this.widget, required this.parametro, required this.titulo});
  Widget widget;
  bool parametro;
  String titulo;

  @override
  State<FiltroCustom> createState() => _FiltroCustomState();
}

class _FiltroCustomState extends State<FiltroCustom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget.parametro = !widget.parametro;
              });
            },
            child: ListTile(
              title: Text(
                widget.titulo,
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
              ),
              trailing: Icon(
                widget.parametro ?  Icons.arrow_upward_rounded :Icons.arrow_downward_rounded,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: widget.parametro? widget.widget:Container(),
          ),
          Divider(thickness: 2, color: Colors.teal),
        ],
      ),
    );
  }
}
