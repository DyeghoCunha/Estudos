import 'package:flutter/material.dart';

class QtdApostadores extends StatefulWidget {
  const QtdApostadores({super.key});

  @override
  State<QtdApostadores> createState() => _QtdApostadoresState();
}

class _QtdApostadoresState extends State<QtdApostadores> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.orangeAccent,Theme.of(context).colorScheme.secondary,Colors
              .deepOrangeAccent],begin:Alignment.topCenter,end: Alignment.bottomCenter ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Row(
crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 5,),
            Icon(Icons.person,color: Colors.white,),
            const SizedBox(width: 5,),
            Text("0022",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            const SizedBox(width: 5,),
          ],
        ),
      ),
    );
  }
}
