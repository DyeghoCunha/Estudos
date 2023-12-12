import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/widget/stickerCardCustomBottomSheet.dart';

class StickerCardItem extends StatelessWidget {
  const StickerCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          context: context,
          elevation: 10,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(1),
          barrierColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          showDragHandle: true,
          enableDrag: true,
          builder: (ctx) => StickerCardCustomBottomSheet(),
        );
      },
      child: Card(
       elevation: 8,
        shadowColor: Colors.black,
        color: Theme.of(context).colorScheme.primary,
        margin: const EdgeInsets.all(10),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
                  width: 50,
                  height: 53.125,
                  child: Image.asset("assets/sticker/8.png", fit: BoxFit.fill,)),
              const SizedBox(height: 5,),
             Text("+ R\$ 314,23", style: TextStyle(color: Colors.deepPurple.shade300,fontWeight: FontWeight
                     .w500,fontSize: 15),),
            ],),
          ),
        ),
      ),
    );
  }
}
