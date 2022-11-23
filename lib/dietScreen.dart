import 'package:cs422_gr4_nutribuddy/dietEditScreen.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 25),
            const Text("Grocery List", style: TextStyle(decoration: TextDecoration.underline, fontSize: 50)),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DietEditScreen()));
            }, child: const Text("Edit")),
          ],
        ),
        Expanded(
          child: ListView(
              children: [for (var i = 0; i < GroceryList.prices.length; i++) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(tag: GroceryList.food[i], child:
              IconButton(
                icon: const Icon(CupertinoIcons.info_circle, size: 40), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DietInfoScreen(i);
                }));
              },

              )),
              Text(GroceryList.food[i], style: const TextStyle(fontSize: 25),),
              Text("\$" "${GroceryList.prices[i]}" ".00", style: const TextStyle(fontSize: 25),)
            ],),
          const Divider(color: Colors.black, thickness: 0.5),
            ]]))
      ],
    );
  }

}