import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/service/utilidades.dart';
import 'package:simplesnacional_vs2/themes/theme_colors.dart';

class Header extends StatefulWidget {
  Header({super.key,   required this.rbt12});

  String rbt12 = "0,00";

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {



    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: ThemeColors.headerGradient,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(45, 40, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: "R\$",
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.rbt12 ,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                 Text(widget.rbt12 == "0,00" ? "Você está sem Faturamento" :
                  "Faturamento dos ultimos 12 meses",
                ),
              ],
            ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: Image.asset("assets/images/logoSimples.png"),
          )
          ],
        ),
      ),
    );
  }
}

