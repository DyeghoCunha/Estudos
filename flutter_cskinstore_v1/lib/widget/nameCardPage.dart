import 'package:flutter/material.dart';

class NameCardPage extends StatelessWidget {
  const NameCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "AK-47",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  "/ Field-Tested",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: [
                const Text(
                  "Fuel Injector",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.copy,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
