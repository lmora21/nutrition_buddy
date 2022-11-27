import 'package:cs422_gr4_nutribuddy/dietEditScreen.dart';
import 'package:cs422_gr4_nutribuddy/home_route_cal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroceryList.dart';
import 'dietInfoScreen.dart';

List<bool> isChecked = List<bool>.generate(9, (index) => false);

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreen();
}

class _DietScreen extends State<DietScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height:30),
        Expanded(
          child: ListView(
              children: [for (var i = 0; i < GroceryList.prices.length; i++) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(tag: GroceryList.food[i], child:
              Expanded(flex: 1, child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.info_outline, size: 45), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DietInfoScreen(i);
                }));
              },

              ))),
              Text(GroceryList.food[i], style: const TextStyle(fontSize: 25),),
              Row(children: [
              Text("\$" "${GroceryList.prices[i]}" ".00", style: const TextStyle(fontSize: 25),),
              const SizedBox(width: 10),
              Transform.scale(scale: 1.5, child:
                Checkbox(
                      value: isChecked[i],
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked[i] = value!;
                        });
                      },
                    )),
              ])
            ],),
                const Divider(color: Colors.grey),
            ]]))
      ],
    );
  }

}