import 'dart:async';

import 'package:flutter/material.dart';

class LoginPhraseWidget extends StatefulWidget {
  final List<String> phrases;

  const LoginPhraseWidget({Key? key, required this.phrases}) : super(key: key);

  @override
  _LoginPhraseWidgetState createState() => _LoginPhraseWidgetState();
}

class _LoginPhraseWidgetState extends State<LoginPhraseWidget> {
  int _currentPhraseIndex = 0;

  var frases =  [
  'esteja no controle do seu futuro.',
  'dê um passo  na gestão da sua empresa.',
  'otimize os resultados do seu negócio.',
  'simplifique a vida do seu contador.',
  'tenha controle total sobre sua empresa.',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Faça seu login e ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Text(
            widget.phrases[_currentPhraseIndex],
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween(
                begin: Offset(1, 0),
                end: Offset(0, 0),
              ).animate(animation),
              child: child,
            );
          },
        ),
      ],
    );
  }

  void _updatePhrase() {
    setState(() {
      _currentPhraseIndex = (_currentPhraseIndex + 1) % widget.phrases.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _updatePhrase();

    // Cria um timer para atualizar a frase a cada 2 segundos
    Timer.periodic(Duration(seconds: 2), (_) => _updatePhrase());
  }
}
