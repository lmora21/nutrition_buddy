import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'dietScreen.dart';
import 'exerScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Nutrition Buddy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _newNdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: _screens[_newNdx]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _newNdx,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Diet"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_run), label: "Exercise")
        ],
        onTap: _onItemTap,
      ),
    );
  }

  void _onItemTap(int ndx) {
    setState(() {
      _newNdx = ndx;
    });
  }
}

List<Widget> get _screens => <Widget>[homeScreen, dietScreen, exerScreen];
