import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RouteAppSettings extends StatefulWidget {
  const RouteAppSettings({super.key});

  @override
  State<RouteAppSettings> createState() => _RouteAppSettingsState();
}

class _RouteAppSettingsState extends State<RouteAppSettings> {
  @override
  Widget build(BuildContext context) {
    Widget settingsItem(
    {
      required String setting,
      required String info,
      required Icon icon,
    }) {
      return Row (
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          Text(
            "$setting: $info",
            style: const TextStyle(fontSize: 30),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.create_outlined, size: 30))
        ]
      );
    }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              settingsItem(
                  icon: const Icon(Icons.account_box, size: 45),
                  setting: "Name",
                  info: "Bob Johnson"
              ),
              settingsItem(
                  icon: const Icon(Icons.calendar_month, size: 45),
                  setting: "Birthday",
                  info: "01/01/2001"
              ),
              settingsItem(
                  icon: const Icon(Icons.male, size: 45),
                  setting: "Gender",
                  info: "Male"
              ),
              settingsItem(
                  icon: const Icon(Icons.monitor_weight, size: 45),
                  setting: "Weight",
                  info: "200 lbs"
              ),
              settingsItem(
                  icon: const Icon(Icons.height, size: 45),
                  setting: "Height",
                  info: "5'8"
              ),
              settingsItem(
                  icon: const Icon(Icons.check, size: 45),
                  setting: "Goal Weight",
                  info: "150"
              ),
              settingsItem(
                  icon: const Icon(Icons.attach_money, size: 45),
                  setting: "Weekly Budget",
                  info: "\$1,010"
              ),
            ],
          ),
        ),
      ),
    );
  }
}
