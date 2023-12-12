import 'package:flutter/material.dart';

class LabelTag extends StatelessWidget {
   LabelTag({super.key, required this.valor, this.isPositivo=false, this.isNegativo=false, this
       .isEntrega=false});

  bool isPositivo;
  bool isNegativo;
  bool isEntrega;
  int valor;

  @override
  Widget build(BuildContext context) {

    Container container;

    if(isPositivo){
     container =  Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "+$valor%",
            style: TextStyle(
              color: Colors.deepPurple.shade100,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }else if(isNegativo){
      container = Container(
        decoration: BoxDecoration(
          color: Colors.green.shade100.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child:
          Text(
            "-$valor%",
            style: TextStyle(
              color: Colors.green.shade100,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }else if(isEntrega){
      container = Container(
        decoration: BoxDecoration(
          color: Colors.cyan.shade100.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Icon(Icons.rocket_launch_sharp, size: 15, color: Colors.cyan.shade100),
              Text(
                "$valor\m",
                style: TextStyle(
                  color: Colors.cyan.shade100,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    } else {container = Container();}

    return Row(
      children: [
        SizedBox(width: 2,),
        container,
        SizedBox(width: 2,),
      ],
    );
  }
}
