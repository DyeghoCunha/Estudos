import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/labelCustomTag.dart';

class CardComprar extends StatelessWidget {
  const CardComprar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1,color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          thickness: 2,
        ),
        Container(
          width: double.infinity,
          height: 125,
          color: Theme.of(context).colorScheme.background.withOpacity(1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    Text("R\$ 4.032,77",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,
                        fontSize: 25),),
                    const SizedBox(width: 20,),
                    LabelCustomTag(texto: "55,97%",userItem: true,),

                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [

                    Expanded(
                      flex: 20,
                        child: ElevatedButton(onPressed: (){}, child: Text("Adicionar", style: TextStyle
                          (fontSize: 20,color: Theme.of(context).colorScheme.secondary),)
    ,)),
                    Expanded(
                       flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 4,
                        child: ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite_border))),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
