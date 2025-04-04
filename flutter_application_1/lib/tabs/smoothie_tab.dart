import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/donut_tile.dart';

class SmoothieTab extends StatelessWidget {
  final Function(double) onAddToCart;

  SmoothieTab({super.key, required this.onAddToCart});
  // Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/images/Smoothie4.png"],
    ["Strawberry", "45", Colors.red, "lib/images/Smoothie6.png"],
    ["Grape ", "84", Colors.purple, "lib/images/Smoothie9.png"],
    ["Chocolate", "95", Colors.brown, "lib/images/Smoothie5.png"],

    ["Mocca", "36", Colors.blue, "lib/images/ChocoSmoothie8.png"],
    ["Orange", "45", Colors.red, "lib/images/OrangeSmoothie3.png"],
    ["Apple", "84", Colors.purple, "lib/images/StrawbeerySmoothie.png"],
    ["Mango", "95", Colors.brown, "lib/images/MangoSmoothie1.png"],

  ];
 

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // Cuántos elementos tiene:
        itemCount: donutsOnSale.length,
        padding: const EdgeInsets.all(12),
        // Encargado de organizar la cuadrícula (El grid Delegate)
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // Determinar el número de columnas (Axis - Eje)
            crossAxisCount: 2,
            childAspectRatio: 1/1.5),
        itemBuilder: (context, index) {
          // Elemento individual de una cuadrícula (Tile)
          return DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutPrice: donutsOnSale[index][1],
            donutColor: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3], donutStore: '',
            onAddToCart: () => onAddToCart(donutsOnSale[index][2]),
          );
        });
  }
}
