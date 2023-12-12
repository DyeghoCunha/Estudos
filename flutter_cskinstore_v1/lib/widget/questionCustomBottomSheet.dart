import 'package:flutter/material.dart';

class QuestionCustomBottomSheet extends StatelessWidget {
  QuestionCustomBottomSheet({super.key, required this.texto, required this.titulo});

  String? texto;
  String? titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Wrap(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
             titulo!,
                style: TextStyle(
                  fontSize: 30,
                  color:Theme.of(context).colorScheme.secondary
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                texto!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
