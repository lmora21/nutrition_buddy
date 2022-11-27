import 'package:flutter/material.dart';

class ExerInfoScreen extends StatefulWidget {
  final String title;
  final String desc;
  final String image;

  const ExerInfoScreen(
      {super.key,
      required this.title,
      required this.desc,
      required this.image});

  @override
  State<ExerInfoScreen> createState() => _ExerInfoScreenState();
}

class _ExerInfoScreenState extends State<ExerInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(widget.title, style: const TextStyle(fontSize: 50)),
            Image.asset("images/${widget.image}", width: 400, height: 400),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Text(widget.desc,
                          style: const TextStyle(fontSize: 16, height: 2.0)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
