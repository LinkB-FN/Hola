 import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic
      donutColor; //dynamic porque será de tipo Color y también usará []
  final String imageName;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
        color: donutColor[50],
        borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
          //price
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(color: donutColor[100], 
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )),
                padding: 
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    child: Text('\$$donutPrice', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                       fontSize: 18,
                        color: donutColor[900]),
          ),
                )
            ],
          ),
          //pic
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 12),
            child: Image.asset(imageName),
          ),
          //flavor

          //love icon + button
          ]
          
        
        ),
    ));
  }
}