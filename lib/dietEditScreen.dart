import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroceryList.dart';
import 'dietInfoScreen.dart';

class DietEditScreen extends StatelessWidget {
  //  Using int index for according Grocery item in GroceryList
  DietEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Grocery List"),
      ),
    body: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // TODO: Fill in screen
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Grocery List", style: TextStyle(decoration: TextDecoration.underline, fontSize: 50)),
          ],
        ),
        for (var i = 0; i < GroceryList.prices.length; i++) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(GroceryList.food[i], style: TextStyle(fontSize: 25),),
              Text("\$" "${GroceryList.prices[i]}", style: TextStyle(fontSize: 25),),
              IconButton(onPressed: () {}, icon: Icon(Icons.create_outlined)),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.trash)),
            ],),
          Divider(color: Colors.black, thickness: 0.5),
        ]
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: ElevatedButton(onPressed: () {  }, child: Text("Add Item", style: TextStyle(fontSize: 20),),), label: ""),
      BottomNavigationBarItem(icon: ElevatedButton(onPressed: () {  }, child: Text("Clear List", style: TextStyle(fontSize: 20),), style: ElevatedButton.styleFrom(
        primary: Colors.red,)), label: "")
    ],),
    );

    // return Column(
    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: <Widget>[
    //     // TODO: Fill in screen
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Text("Grocery List", style: TextStyle(decoration: TextDecoration.underline, fontSize: 50)),
    //       ],
    //     ),
    //     for (var i = 0; i < GroceryList.prices.length; i++) ...[
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Hero(tag: GroceryList.food[i], child:
    //           IconButton(
    //             icon: Icon(CupertinoIcons.info_circle, size: 20), onPressed: () {
    //             Navigator.push(context, MaterialPageRoute(builder: (context){
    //               return DietInfoScreen(i);
    //             }));
    //           },
    //
    //           )),
    //           Text(GroceryList.food[i], style: TextStyle(fontSize: 25),),
    //           Text("\$" "${GroceryList.prices[i]}", style: TextStyle(fontSize: 25),)
    //         ],),
    //       Divider(color: Colors.black, thickness: 0.5),
    //     ]
    //   ],
    // );
  }


}
