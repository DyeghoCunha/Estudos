import 'package:flutter/material.dart';

class YourBalanceCard extends StatelessWidget {
  const YourBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Text(
                    "R\$ 0,00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Seu Saldo",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
              ElevatedButton(onPressed: (){}, child: Icon(Icons.add, color: Theme.of(context).colorScheme.secondary,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
