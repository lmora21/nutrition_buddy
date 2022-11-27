import 'dart:io';

import 'package:cs422_gr4_nutribuddy/exercise_info_route.dart';
import 'package:cs422_gr4_nutribuddy/home_route_cal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_size/window_size.dart';
import 'home_screen.dart';
import 'dietScreen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

List<bool> isChecked = List<bool>.generate(9, (index) => false);

void main() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    setWindowMaxSize(const Size(500, 800));
    setWindowMinSize(const Size(500, 800));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrition Buddy',
      theme: ThemeData(
        primaryColor: Colors.blue.shade800,
        colorScheme: ColorScheme(
          primary: Colors.blue.shade800,
          brightness: Brightness.dark,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.pink,
          onError: Colors.black,
          background: Colors.black,
          onBackground: Colors.black,
          surface: Colors.blue.shade800,
          onSurface: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Nutrition Buddy'),
      debugShowCheckedModeBanner: false,
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
    Widget exerciseItem(
        {required String title,
        required String hint,
        required String desc,
        required String img,
        required int index}) {
      return GestureDetector(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                const Expanded(
                    flex: 1, child: Icon(Icons.info_outline, size: 45)),
                // Title
                Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "$title $hint",
                        style: const TextStyle(fontSize: 30),
                      ),
                    )),
                // Checkbox
                Expanded(
                  flex: 1,
                  child: Transform.scale(
                    scale: 1.5,
                    child: Align(
                      child: Checkbox(
                        value: isChecked[index],
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[index] = value!;
                          });
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            indentedDivider(),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  ExerInfoScreen(title: title, desc: desc, image: img),
            ),
          );
        },
      );
    }

    Widget restItem({required int minutes, required int index}) {
      return Column(
        children: [
          Row(
            children: [
              // Empty left space
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              // Title
              Expanded(
                flex: 4,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Rest (${minutes == 1 ? "1 minute" : "$minutes minutes"})",
                        style: const TextStyle(fontSize: 30))),
              ),
              // Checkbox
              Expanded(
                flex: 1,
                child: Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: isChecked[index],
                    onChanged: (bool? value) {
                      setState(
                        () {
                          isChecked[index] = value!;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          indentedDivider(),
        ],
      );
    }

    return Scaffold(
      body: Center(
        child: <Widget>[
          homeScreen(context),
          DietScreen(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Today's Workout",
                      style: TextStyle(
                          fontSize: 50, decoration: TextDecoration.underline))),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    exerciseItem(
                      title: "Sit Ups",
                      hint: "(20 reps)",
                      desc:
                          "1. Start by lying on your back with your knees bent. Sit ups work best if you do them on a soft surface, such as a mattress. Keep your knees bent at a 90-degree angle, with your feet flat on the floor.\n\n2. Put your fingertips on the back of your ears. Your elbows should be bent and pointing out at your sides. Cupping the back of your ears with your fingertips — as opposed to placing them on the back of your head — can help prevent you from pulling yourself up by your neck as you’re doing sit ups.\n\n3. Lift your torso up as close to your thighs as possible. Do this with a smooth, steady motion, keeping your feet flat on the floor. When you’re done lifting your torso, your lower back should be off the floor.\n\n4. Lower your torso down to the floor so you’re back in the starting position. Like you did when you lifted your torso up to your thighs, use a smooth and steady motion as you lower it down.",
                      img: "situps.gif",
                      index: 0,
                    ),
                    restItem(minutes: 2, index: 1),
                    exerciseItem(
                      title: "Push Ups",
                      hint: "(15 reps)",
                      desc:
                          "1. Assume a face-down prone position on the floor. Keep your feet together. Your weight should be on your chest. Position hands palms-down on the floor, approximately shoulder width apart. They should be about next to your shoulders, with your elbows pointed towards your toes.\n\n2. Raise yourself using your arms. At this point, your weight should be supported by your hands and the balls of your feet. Make a straight line from your head to your heels, and contract your abdominals to keep your hips from sagging. This position is called a \"plank,\" which is used for other various exercises. This is the beginning and the end position of a single push up.",
                      img: "pushups.gif",
                      index: 2,
                    ),
                    restItem(minutes: 2, index: 3),
                    exerciseItem(
                      title: "Plank",
                      hint: "(1 minute)",
                      desc:
                          "To do a traditional plank, lay on your stomach on the floor with your arms bent at the elbow so your hands are under your shoulders. Raise up slowly so that your arms are extended and you're on your toes (or your knees, if you're a beginner) with your legs and back straight. Hold the position for 5 to 10 seconds and gradually work up to 3 sets of 60 seconds each.",
                      img: "plank.jpg",
                      index: 4,
                    ),
                    restItem(minutes: 1, index: 5),
                    exerciseItem(
                      title: "Pull Ups",
                      hint: "(10 reps)",
                      desc:
                          "Grip a pullup bar with your palms facing whichever direction you prefer. In general, having your palms facing towards you is most efficient. When you pull yourself up with your hands facing this way, you give your biceps and lats a better workout. Pulling yourself up with your palms out is considered the most difficult way to pull up your bodyweight but also gives deltoids and triceps a good workout. Start with your arms fully extended. \n\n2. Pull your bodyweight up until your chin is just barely above the bar. You may have to strain, but keep pulling until you've lifted yourself up using your back and biceps.\n\n3. Lower yourself until your arms are fully extended. Lower yourself in a controlled way to work the muscles harder and prep yourself for the next pull.",
                      img: "pullups.gif",
                      index: 6,
                    ),
                    restItem(minutes: 2, index: 7),
                    exerciseItem(
                      title: "Burpees",
                      hint: "(20 reps)",
                      desc:
                          "1. Stand with your feet shoulder-width apart. Hold your arms at your sides and stand with your knees straight. Also, make sure to tighten your abs, keep your back flat, and squeeze your buttocks at the start of each burpee.\n\n2.  Bend at your hips and knees to lower yourself into a squatting position. Hinge forward with your hips and bend your knees slightly to bring your body down lower to the floor. Keep your back straight and your arms in close to your body as you do this.\n\n3. Place your hands on the floor in front of you. Keep your hands close together so they are directly under your shoulders when you place them on the ground. Hold your arms out straight, but don't lock out your elbows.\n\n4. Kick your feet back so that you are in the plank position. Jump both feet back behind you at the same time and position them about shoulder-width apart. Keep your hands planted firmly on the ground to support your body as you do this.\n\n5. Drop all the way down to the floor. Once you are in the plank position, carefully lower your chest all the way down to the floor to do a pushup. Keep your hands flat on the floor with your elbows up in the air and your arms close to your body.\n\n6. Press up with your arms and jump your feet forward. Keep your hands flat on the ground and push off from the ground with your hand as you hinge forward at the hips and jump your feet towards your chest. Do this in 1 smooth motion.\n\n7. Jump straight upwards to finish the move. Once your feet are back under your upper body, jump straight up with your hands and arms raised over your head and then land in the standing position. You can jump as high as you are able, or just do a little hop in the air to finish the burpee.",
                      img: "burpees.gif",
                      index: 8,
                    ),
                  ],
                ),
              ),
            ],
          )
        ][_newNdx],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(60)),
        child: Stack(
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.cyan],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              unselectedItemColor: Colors.blue.shade800,
              elevation: 0,
              currentIndex: _newNdx,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.restaurant), label: "Diet"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.directions_run), label: "Exercise")
              ],
              onTap: _onItemTap,
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTap(int ndx) {
    setState(() {
      _newNdx = ndx;
    });
  }
}
