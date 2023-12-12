import 'package:flutter/material.dart';

class FotoNomeCard extends StatelessWidget {
  const FotoNomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70), color: Theme.of(context).colorScheme.secondary),
              width: 135,
              height: 135,
            ),
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.transparent, // Defina o fundo como transparente para que a imagem fique visível
              child: ClipOval(
                child: Image.asset(
                  'assets/images/face.gif',
                  width: 150, // Ajuste o tamanho da imagem de acordo com o raio do CircleAvatar
                  height: 150,
                  fit: BoxFit.cover, // Ajuste o modo de ajuste da imagem conforme necessário
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Nome do Usuário",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
