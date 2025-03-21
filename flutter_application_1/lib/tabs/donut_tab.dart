import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/donut_tile.dart';

class DonutTab extends StatelessWidget {
  final Function(double) onAddToCart;

  DonutTab({required this.onAddToCart});
  // Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Plain donut", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Zelda Donut", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Spicy", "50", Colors.purple, "lib/images/grape_donut.png"],
    ["Sweets galore", "35", Colors.brown, "lib/images/chocolate_donut.png"],

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
            onAddToCart: () => onAddToCart(double.parse(donutsOnSale[index][1])),

          );
        });
  }
}
