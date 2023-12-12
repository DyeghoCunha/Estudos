import 'package:flutter/material.dart';

class UserMainSettingsCardCustomRow extends StatelessWidget {
  UserMainSettingsCardCustomRow({super.key, required this.icone, required this.texto});
IconData icone;
String texto;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
       onPressed: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(icone, color: Colors.white,),
                Text(texto,style: TextStyle(color: Colors.white),)
              ],
            ),
            Icon(Icons.arrow_forward_ios,color: Theme.of(context).colorScheme.onPrimary,size: 20,),
          ],
        ),
      ),
    );
  }
}
