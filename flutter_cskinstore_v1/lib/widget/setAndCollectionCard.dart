import 'package:flutter/material.dart';

class SetAndCollectionCard extends StatelessWidget {
  const SetAndCollectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextButton(
            onPressed: (){},
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/images/wildFire.png"),
                ),
                SizedBox(width: 10,),
                Text(
                  "The Wildfire Collection",
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 20),
                ),
              ],
            ),
          ),
          Divider(height: 0.5,color: Theme.of(context).colorScheme.onPrimary,),
          TextButton(
            onPressed: (){},
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/images/wildFireCase.png"),
                ),
                SizedBox(width: 10,),
                Text(
                  "Operation Wildfire Case",
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
