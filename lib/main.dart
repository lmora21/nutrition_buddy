import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'dietScreen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

List<bool> isChecked = List<bool>.generate(9, (index) => false);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrition Buddy',
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

class CalendarScreen extends StatefulWidget {
  final String title;

  const CalendarScreen({super.key, required this.title});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Monthly Activity'),
        ),
        body: Center(
          child: SfCalendar(
              view: CalendarView.month,
              showWeekNumber: true,
              weekNumberStyle: const WeekNumberStyle(
                backgroundColor: Color.fromARGB(255, 30, 142, 233),
                textStyle: TextStyle(color: Colors.white, fontSize: 15),
              )),
        ));
  }
}

class ExerInfoScreen extends StatefulWidget {
  final String title;

  const ExerInfoScreen({super.key, required this.title});

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
                // TODO: Build exercise info screen
                )));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _newNdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: <Widget>[
        homeScreen(context),
        DietScreen(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CalendarScreen(
                              title: 'Calendar',
                            ),
                          ));
                    },
                    icon: const Icon(CupertinoIcons.calendar, size: 45),
                    padding: const EdgeInsets.all(0))),
            const Text("Today's Workout",
                style: TextStyle(
                    fontSize: 50, decoration: TextDecoration.underline)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ExerInfoScreen(
                                    title: 'Sit Ups',
                                  ),
                                ));
                          },
                          icon:
                              const Icon(CupertinoIcons.info_circle, size: 45),
                          padding: const EdgeInsets.all(0)),
                      const Text("Sit Ups (20 reps)",
                          style: TextStyle(fontSize: 40)),
                      Transform.scale(
                          scale: 1.5,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Checkbox(
                                      value: isChecked[0],
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked[0] = value!;
                                        });
                                      })))),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 45),
                      const Text("Rest (2 minutes)",
                          style: TextStyle(fontSize: 40)),
                      Transform.scale(
                          scale: 1.5,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Checkbox(
                                  value: isChecked[1],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked[1] = value!;
                                    });
                                  }))),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ExerInfoScreen(
                                    title: 'Push Ups',
                                  ),
                                ));
                          },
                          icon:
                              const Icon(CupertinoIcons.info_circle, size: 45),
                          padding: const EdgeInsets.all(0)),
                      const Text("Push Ups (15 reps)",
                          style: TextStyle(fontSize: 40)),
                      Transform.scale(
                          scale: 1.5,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Checkbox(
                                  value: isChecked[2],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked[2] = value!;
                                    });
                                  }))),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 45),
                      const Text("Rest (2 minutes)",
                          style: TextStyle(fontSize: 40)),
                      Transform.scale(
                          scale: 1.5,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Checkbox(
                                  value: isChecked[3],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked[3] = value!;
                                    });
                                  }))),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ExerInfoScreen(
                                    title: 'Plank',
                                  ),
                                ));
                          },
                          icon:
                              const Icon(CupertinoIcons.info_circle, size: 45),
                          padding: const EdgeInsets.all(0)),
                      const Text("Plank (1 minute)",
                          style: TextStyle(fontSize: 40)),
                      Transform.scale(
                          scale: 1.5,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Checkbox(
                                  value: isChecked[4],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked[4] = value!;
                                    });
                                  }))),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 45),
                      const Text("Rest (1 minute)",
                          style: TextStyle(fontSize: 40)),
                      Transform.scale(
                          scale: 1.5,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Checkbox(
                                  value: isChecked[5],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked[5] = value!;
                                    });
                                  }))),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ExerInfoScreen(
                                    title: 'Pull Ups',
                                  ),
                                ));
                          },
                          icon:
                              const Icon(CupertinoIcons.info_circle, size: 45),
                          padding: const EdgeInsets.all(0)),
                      const Text("Pull Ups (10 reps)",
                          style: TextStyle(fontSize: 40)),
                      Transform.scale(
                          scale: 1.5,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Checkbox(
                                  value: isChecked[6],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked[6] = value!;
                                    });
                                  }))),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 45),
                      const Text("Rest (2 min)",
                          style: TextStyle(fontSize: 40)),
                      Transform.scale(
                          scale: 1.5,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Checkbox(
                                  value: isChecked[7],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked[7] = value!;
                                    });
                                  }))),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ExerInfoScreen(
                                    title: 'Jumping Jacks',
                                  ),
                                ));
                          },
                          icon:
                              const Icon(CupertinoIcons.info_circle, size: 45),
                          padding: const EdgeInsets.all(0)),
                      const Text("Jumping Jacks (30 reps)",
                          style: TextStyle(fontSize: 40)),
                      Transform.scale(
                          scale: 1.5,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Checkbox(
                                  value: isChecked[8],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked[8] = value!;
                                    });
                                  }))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ][_newNdx]),
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
