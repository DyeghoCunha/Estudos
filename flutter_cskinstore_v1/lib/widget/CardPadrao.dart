import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/CardPadraoStickers.dart';
import 'package:flutter_cskinstore_v1/widget/labelTag.dart';

import '../pages/CardPage.dart';

class CardPadrao extends StatefulWidget {
  const CardPadrao({super.key});

  @override
  State<CardPadrao> createState() => _CardPadraoState();
}

class _CardPadraoState extends State<CardPadrao> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CardPage()));},
      child: Stack(
        children: [
          Card(
            color: const Color.fromRGBO(56, 58, 71, 1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 4, left: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock,
                        size: 15,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                      Text(
                        "2 days",
                        style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 10),
                  child: Image.asset("assets/images/arma1.png"),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                          LabelTag(valor: 26,isPositivo: true,),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Colors.green.shade100.withOpacity(0.2),
                            //     borderRadius: BorderRadius.circular(5),
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(2.0),
                            //     child:
                            //     Text(
                            //       "-12%",
                            //       style: TextStyle(
                            //         color: Colors.green.shade100,
                            //         fontWeight: FontWeight.w500,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(width: 2,),
                           LabelTag(valor: 5,isEntrega: true,),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "StatTrak",
                          style: TextStyle(color: Color.fromRGBO(245, 132, 1, 1)),
                        ),
                        const Text(
                          "FN / 0.0183",
                          style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "R\$ 55.373,91",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(36, 38, 47, 1),
                        ),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    )),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(36, 38, 47, 1),
                        ),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.favorite,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    )),
                    const SizedBox(
                      width: 2,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CardPadraoStickers(stickerNumber: "6"),
                const SizedBox(
                  height: 4,
                ),
                CardPadraoStickers(stickerNumber: "6"),
                const SizedBox(
                  height: 4,
                ),
                CardPadraoStickers(stickerNumber: "6"),
                const SizedBox(
                  height: 4,
                ),
                CardPadraoStickers(stickerNumber: "6"),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
