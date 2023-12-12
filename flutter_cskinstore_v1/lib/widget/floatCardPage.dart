import 'package:flutter/material.dart';

import '../models/questionDb.dart';
import '../utils/skin3dtest.dart';
import 'btnQuestion.dart';

class FloatCardPage extends StatelessWidget {
  const FloatCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Float",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "0.1512",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onPrimary,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  BtnQuestion(
                    texto: questionDb["float"],
                    titulo: "Float",
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Transform.rotate(
                    angle: 90 * 3.141592653589793 / 180,
                    child: const Icon(
                      Icons.label_important,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              GradientContainer(),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
