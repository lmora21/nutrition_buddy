import 'package:cs422_gr4_nutribuddy/dietEditScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroceryList.dart';
import 'dietInfoScreen.dart';

List<bool> isChecked = List<bool>.generate(9, (index) => false);

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  //final String title;

  @override
  State<DietScreen> createState() => _DietScreen();
}

class _DietScreen extends State<DietScreen> {
  //const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 25),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: Text("Grocery List", style: TextStyle(decoration: TextDecoration.underline, fontSize: 50))),
            Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0), child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DietEditScreen()));
            }, child: const Text("Edit"))),
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
                icon: const Icon(Icons.info_outline, size: 45), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DietInfoScreen(i);
                }));
              },

              )),
              Text(GroceryList.food[i], style: const TextStyle(fontSize: 25),),
              Row(children: [
              Text("\$" "${GroceryList.prices[i]}" ".00", style: const TextStyle(fontSize: 25),),
              Checkbox(
                      value: isChecked[i],
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked[i] = value!;
                        });
                      },
                    ),
              ])
            ],),
          const Divider(color: Colors.black),
            ]]))
      ],
    );
  }

}