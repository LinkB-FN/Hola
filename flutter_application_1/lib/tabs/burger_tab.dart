import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/donut_tile.dart';

class BurgerTab extends StatelessWidget {
   final Function(double) onAddToCart;

  BurgerTab({required this.onAddToCart});
  // Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Fortnite Burger", "40", Colors.blue, "lib/images/FortniteBurger.png"],
    ["Big burger", "45", Colors.red, "lib/images/Burger1.png"],
    ["Suspicous Burger", "84", Colors.purple, "lib/images/Burger2.png"],
    ["Nice Burger", "95", Colors.brown, "lib/images/Burger3.png"],
    ["Skibidi Burger", "36", Colors.blue, "lib/images/Burger4.png"],
    ["The Burger", "45", Colors.red, "lib/images/Burger5.png"],
    ["Torta de invencible", "84", Colors.purple, "lib/images/Burger6.png"],
    ["Plain Burger", "95", Colors.brown, "lib/images/Cheeseburger.png"],

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
