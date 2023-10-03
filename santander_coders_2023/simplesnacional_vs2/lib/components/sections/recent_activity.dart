import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/box_card.dart';
import 'package:simplesnacional_vs2/components/color_dot.dart';
import 'package:simplesnacional_vs2/components/content_division.dart';
import 'package:simplesnacional_vs2/themes/theme_colors.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: BoxCard(
        boxContent: _RecentActivityContent(),
      ),
    );
  }
}

class _RecentActivityContent extends StatelessWidget {
  const _RecentActivityContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ColorDot(color: ThemeColors.recentActivity["spent"]!),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Faturamento", style: TextStyle(color: ThemeColors.cinza),),
                    Text(
                      "\$9900.97",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ColorDot(color: ThemeColors.recentActivity["income"]!),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Imposto",style: TextStyle(color: ThemeColors.cinza)),
                    Text(
                      "\$5940,06",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Text("Próxima faixa em : R\$353.534,03",style: TextStyle(color: ThemeColors.cinza)),
        ),
        LinearProgressIndicator(
          value: 0.1,
          minHeight: 8,
          borderRadius: BorderRadius.circular(5),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ContentDivision(),
        ),
        Text("A sua alíquota vai aumentar de 6% para 6,47% no próximo mês ",style: TextStyle(color: ThemeColors.cinza)),
        Row(
          children: [
            Expanded(child:Container()),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.greenAccent.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text("Diga-me como!"),
            ),
          ],
        ),
      ],
    );
  }
}
