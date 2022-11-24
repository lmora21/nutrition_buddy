import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroceryList.dart';

class DietInfoScreen extends StatelessWidget {
  //  Using int index for according Grocery item in GroceryList
  final int itemIndex;

  const DietInfoScreen(this.itemIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GroceryList.titles[itemIndex]),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            Text(GroceryList.titles[itemIndex], style: const TextStyle(color: Colors.black, decoration: TextDecoration.underline, fontSize: 40),),
            Text("${GroceryList.calPerServ[itemIndex]} cal per serving of ${GroceryList.servings[itemIndex]}", style: const TextStyle(fontSize: 20),),
            const Padding(padding: EdgeInsets.only(top: 10)),
              //  Need 5 rows for each nutritional info value - fat, carbs, protein, etc.
              //  Fat
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total Fat: ${GroceryList.fatPerServ[itemIndex]}g", style: const TextStyle(fontSize: 40),),
                ],),
              const Divider(color: Colors.black),
              // Carb
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Carbohydrates: ${GroceryList.carbPerServ[itemIndex]}g", style: const TextStyle(fontSize: 40),),
              ],),
            const Divider(color: Colors.black),
            //  Cholesterol
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Cholesterol: ${GroceryList.cholPerServ[itemIndex]}mg", style: const TextStyle(fontSize: 40),),
              ],),
            const Divider(color: Colors.black),
            //  Sodium
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sodium: ${GroceryList.sodiumPerServ[itemIndex]}mg", style: const TextStyle(fontSize: 40),),
              ],),
            const Divider(color: Colors.black),
            // Protein
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Protein: ${GroceryList.proteinPerServ[itemIndex]}g", style: const TextStyle(fontSize: 40),),
              ],),
            const Divider(color: Colors.black),
            //  Potassium
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Potassium: ${GroceryList.ptsmPerServ[itemIndex]}mg", style: const TextStyle(fontSize: 40),),
              ],),
            const Divider(color: Colors.black),
            //  Fiber
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Fiber: ${GroceryList.fiberPerServ[itemIndex]}g", style: const TextStyle(fontSize: 40),),
              ],),
            const Divider(color: Colors.black),
            //  Sugars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sugar: ${GroceryList.sugarsPerServ[itemIndex]}g", style: const TextStyle(fontSize: 40),),
              ],),
            const Divider(color: Colors.black),
          ],
        ),
      ),
    );
  }


}
