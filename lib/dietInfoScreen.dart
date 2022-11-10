import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroceryList.dart';

class DietInfoScreen extends StatelessWidget {
  //  Using int index for according Grocery item in GroceryList
  final int itemIndex;

  DietInfoScreen(this.itemIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GroceryList.titles[itemIndex]),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(GroceryList.titles[itemIndex], style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, fontSize: 40),),
            Text("${GroceryList.calPerServ[itemIndex]} cal per serving of ${GroceryList.servings[itemIndex]}", style: TextStyle(fontSize: 20),),
            Padding(padding: EdgeInsets.only(top: 10)),
              //  Need 5 rows for each nutritional info value - fat, carbs, protein, etc.
              //  Fat
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total Fat: ${GroceryList.fatPerServ[itemIndex]}g", style: TextStyle(fontSize: 40),),
                ],),
              Divider(color: Colors.black, thickness: 0.5),
              // Carb
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Carbohydrates: ${GroceryList.carbPerServ[itemIndex]}g", style: TextStyle(fontSize: 40),),
              ],),
            Divider(color: Colors.black, thickness: 0.5),
            //  Cholesterol
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Cholesterol: ${GroceryList.cholPerServ[itemIndex]}mg", style: TextStyle(fontSize: 40),),
              ],),
            Divider(color: Colors.black, thickness: 0.5),
            //  Sodium
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sodium: ${GroceryList.sodiumPerServ[itemIndex]}mg", style: TextStyle(fontSize: 40),),
              ],),
            Divider(color: Colors.black, thickness: 0.5),
            // Protein
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Protein: ${GroceryList.proteinPerServ[itemIndex]}g", style: TextStyle(fontSize: 40),),
              ],),
            Divider(color: Colors.black, thickness: 0.5),
            //  Potassium
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Potassium: ${GroceryList.ptsmPerServ[itemIndex]}mg", style: TextStyle(fontSize: 40),),
              ],),
            Divider(color: Colors.black, thickness: 0.5),
            //  Fiber
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Fiber: ${GroceryList.fiberPerServ[itemIndex]}g", style: TextStyle(fontSize: 40),),
              ],),
            Divider(color: Colors.black, thickness: 0.5),
            //  Sugars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sugar: ${GroceryList.sugarsPerServ[itemIndex]}g", style: TextStyle(fontSize: 40),),
              ],),
            Divider(color: Colors.black, thickness: 0.5),
          ],
        ),
      ),
    );
  }


}
