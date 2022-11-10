import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroceryList.dart';

class DietEditScreen extends StatelessWidget {
  //  Using int index for according Grocery item in GroceryList
  const DietEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Grocery List"),
      ),
    body: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Grocery List", style: TextStyle(decoration: TextDecoration.underline, fontSize: 50)),
          ],
        ),
        Expanded(
          child: ListView(
            children: [for (var i = 0; i < GroceryList.prices.length; i++) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(GroceryList.food[i], style: const TextStyle(fontSize: 25),),
              Text("\$" "${GroceryList.prices[i]}", style: const TextStyle(fontSize: 25),),
              IconButton(onPressed: () {}, icon: const Icon(Icons.create_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.trash)),
            ],),
          const Divider(color: Colors.black, thickness: 0.5),
        ]]))
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: ElevatedButton(onPressed: () {  }, child: const Text("Add Item", style: TextStyle(fontSize: 20),),), label: ""),
      BottomNavigationBarItem(icon: ElevatedButton(onPressed: () {  }, style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,), child: const Text("Clear List", style: TextStyle(fontSize: 20),)), label: "")
    ],),
    );
  }


}
