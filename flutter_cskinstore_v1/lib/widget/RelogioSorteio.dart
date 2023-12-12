import 'package:flutter/material.dart';
import 'package:flutter_flip_clock/flutter_flip_clock.dart';

class RelogioSorteio extends StatefulWidget {
  const RelogioSorteio({super.key});

  @override
  State<RelogioSorteio> createState() => _RelogioSorteioState();
}

class _RelogioSorteioState extends State<RelogioSorteio> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dias
            FlipPanel<int>.stream(
              itemStream: Stream.periodic(Duration(days: 1), (count) => count % 10),
              itemBuilder: (context, value) => Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  '$value',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.white
                  ),
                ),
              ),
              initValue: 3,
            ),
            Text(":",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            // Horas
            FlipPanel<int>.stream(
              itemStream: Stream.periodic(Duration(hours: 1), (count) => count % 24),
              itemBuilder: (context, value) => Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  '$value',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.white
                  ),
                ),
              ),
              initValue: 10,
            ),
            // Minutos
            Text(":",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            FlipPanel<int>.stream(
              itemStream: Stream.periodic(Duration(minutes: 1), (count) => count % 60),
              itemBuilder: (context, value) => Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  '$value',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.white
                  ),
                ),
              ),
              initValue: 10,
            ),
            Text(":",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            FlipPanel<int>.stream(
              itemStream: Stream.periodic(Duration(seconds: 1), (count) => count % 60),
              itemBuilder: (context, value) => Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  '$value',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.white
                  ),
                ),
              ),
              initValue: 10,
            ),
            // Segundos

          ],
        ),
      ),
    );
  }
}
