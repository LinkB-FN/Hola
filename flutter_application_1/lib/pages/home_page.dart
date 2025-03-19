import 'package:flutter/material.dart';
import 'package:flutter_application_1/tabs/burger_tab.dart';
import 'package:flutter_application_1/tabs/donut_tab.dart';
import 'package:flutter_application_1/tabs/pizza_tab.dart';
import 'package:flutter_application_1/tabs/smoothie_tab.dart';
import 'package:flutter_application_1/utils/my_tab.dart';

import '../tabs/pancake_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> myTabs = [
    //Donut tab
    const MyTab(iconPath: 'lib/icons/donut.png'),
    //Burguer tab
    const MyTab(iconPath: 'lib/icons/burger.png'),
    //Smoothie tab
    const MyTab(iconPath: 'lib/icons/smoothie.png'),
    //Pancake tab
    const MyTab(iconPath: 'lib/icons/pancakes.png'),
    //Pizza tab
    const MyTab(iconPath: 'lib/icons/pizza.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //ícono de la izquierda
          leading: Icon(
            Icons.menu,
            color: Colors.grey[800],
          ),
          actions:[Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person),
          )],
        ),
        body: Column(
          children:[
            //Texto "I want to eat"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 32),),
                  Text("Eat", style: TextStyle(
                    //Tamaño de letra
                    fontSize: 32, 
                    //Negritas
                    fontWeight: FontWeight.bold,
                    //subrayado 
                    decoration:TextDecoration.underline),
                    )
                ],
              ),
            ),
            //Tab bar
            TabBar(tabs: myTabs),
            //Tab bar view
            Expanded(
              child: TabBarView(children: [
                DonutTab(),
                BurgerTab(), 
                SmoothieTab(),
                PancakeTab(),
                PizzaTab(),


              ],
              ),
            ),
            //Carrito
            Container(
              color:Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Column(
                      //alinear a la izquierda
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("6 items | \$12.99",
                         style: TextStyle(
                          fontSize:18,
                          fontWeight: FontWeight.bold),),
                        Text(
                          'Delivery charge included', 
                        style: TextStyle(fontSize:12),
                    ),
                    
                        
                      ],
                    )
                  ),
                  ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 215, 113, 148),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12)),
                          child: const Text(
                        'View Cart', style: TextStyle(color: Colors.white),
                      )),
                ]
              ),
            )
          ],
        )
      ),
    );
  }
}