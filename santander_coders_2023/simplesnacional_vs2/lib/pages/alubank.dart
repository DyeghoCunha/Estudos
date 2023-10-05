import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/box_card.dart';
import 'package:simplesnacional_vs2/components/color_dot.dart';
import 'package:simplesnacional_vs2/components/content_division.dart';
import 'package:simplesnacional_vs2/components/sections/account_actions.dart';
import 'package:simplesnacional_vs2/components/sections/header.dart';
import 'package:simplesnacional_vs2/components/sections/recent_activity.dart';
import 'package:simplesnacional_vs2/components/sections/tax_detail.dart';

import '../themes/theme_colors.dart';

class Alubank extends StatelessWidget {
  const Alubank({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:ListView(
        children: <Widget> [
          Header(),
          RecentActivity(),
          AccountActions(),
          TaxDetail()

        ],
      ),
    );
  }
}
