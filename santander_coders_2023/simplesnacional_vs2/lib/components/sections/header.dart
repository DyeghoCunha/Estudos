import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/themes/theme_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

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
        padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Text("\$1000.00", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                Text.rich(
                  TextSpan(
                    text: "R\$",
                    children: <TextSpan>[
                      TextSpan(
                        text: "176.000,00",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Text(
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
