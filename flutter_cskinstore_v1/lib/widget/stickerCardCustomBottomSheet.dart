import 'package:flutter/material.dart';

class StickerCardCustomBottomSheet extends StatelessWidget {
  const StickerCardCustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 160,
                child: Image.asset(
                  "assets/sticker/8.png",
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                "Sticker|Natus Vincere (Foil)| Katowice 2015",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "ESL One Katowice 2015 Legends",
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wear",
                              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
                            ),
                            const Text(
                              "0%",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Markup",
                              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
                            ),
                            const Text(
                              "+ R\$ 314,23",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wiki Price",
                              style: TextStyle(color: Colors.deepPurple.shade300, fontSize: 20),
                            ),
                            Wrap(
                              children: [
                                Text(
                                  "R\$ 870,94",
                                  style: TextStyle(
                                      color: Colors.deepPurple.shade300,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.deepPurple.shade300,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
