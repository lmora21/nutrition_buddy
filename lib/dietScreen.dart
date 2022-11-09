import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroceryList.dart';

Column get dietScreen => Column(
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    // TODO: Fill in screen
    Text("Grocery List", style: TextStyle(decoration: TextDecoration.underline, fontSize: 50)),
    for (var i = 0; i < GroceryList.prices.length; i++) ...[
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Text("\u2022", style: TextStyle(fontSize: 30),),
        Hero(tag: GroceryList.food[i], child:
        IconButton(
           icon: Icon(CupertinoIcons.info_circle, size: 20), onPressed: () {  },

        )),
        Text(GroceryList.food[i], style: TextStyle(fontSize: 25),),
        Text("\$" "${GroceryList.prices[i]}", style: TextStyle(fontSize: 25),)

        // Text("\$" + "${GroceryList.prices[i]}", style: TextStyle(fontSize: 30),)
      ],),
     Divider(color: Colors.black, thickness: 1.0,),
    ]
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     Text("\u2022", style: TextStyle(fontSize: 30),),
    //     Text("2 Flour Tortilla", style: TextStyle(fontSize: 30),),
    //     Text("\$5", style: TextStyle(fontSize: 30),)
    //   ],
    // ),
    // const Divider(color: Colors.black),
  ],
);
