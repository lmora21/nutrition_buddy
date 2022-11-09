import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroceryList.dart';
import 'dietInfoScreen.dart';


class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // TODO: Fill in screen
        Text("Grocery List", style: TextStyle(decoration: TextDecoration.underline, fontSize: 50)),
        for (var i = 0; i < GroceryList.prices.length; i++) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(tag: GroceryList.food[i], child:
              IconButton(
                icon: Icon(CupertinoIcons.info_circle, size: 20), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DietInfoScreen(i);
                }));
              },

              )),
              Text(GroceryList.food[i], style: TextStyle(fontSize: 25),),
              Text("\$" "${GroceryList.prices[i]}", style: TextStyle(fontSize: 25),)
            ],),
          Divider(color: Colors.black, thickness: 0.5),
        ]
      ],
    );
  }

}