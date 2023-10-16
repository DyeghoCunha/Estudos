import 'package:flutter/material.dart';
import 'package:simplesnacional_vs2/components/box_card.dart';
import 'package:simplesnacional_vs2/pages/faturamentoMes.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Ações da conta",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FaturamentoMes(),));
                },
                splashColor: Colors.greenAccent,
                borderRadius: BorderRadius.circular(8),
                child: const BoxCard(
                    boxContent: _AccountActionsContent(
                  icon: Icon(Icons.analytics_outlined),
                  text: "Faturamento",
                )),
              ),
              InkWell(
                onTap: (){},
                splashColor: Colors.redAccent,
                borderRadius: BorderRadius.circular(8),
                child: const BoxCard(
                    boxContent: _AccountActionsContent(
                      icon: Icon(Icons.trending_down),
                      text: "Impostos",
                    )),
              ),
             InkWell(
               onTap: (){},
               splashColor: Colors.amberAccent,
               borderRadius: BorderRadius.circular(8),
               child: const BoxCard(
                    boxContent: _AccountActionsContent(
                      icon: Icon(Icons.query_stats),
                      text: "Gráficos",
                    )),

             )
            ],
          )
        ],
      ),
    );
  }
}

class _AccountActionsContent extends StatelessWidget {
  final Icon icon;
  final String text;

  const _AccountActionsContent({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: icon,
        ), Text(text,style: TextStyle(fontSize: 12),),],
      ),
    );
  }
}
