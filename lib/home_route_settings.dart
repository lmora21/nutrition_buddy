import 'package:flutter/material.dart';

class RouteAppSettings extends StatefulWidget {
  const RouteAppSettings({super.key});

  @override
  State<RouteAppSettings> createState() => _RouteAppSettingsState();
}

class _RouteAppSettingsState extends State<RouteAppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.cyan],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
