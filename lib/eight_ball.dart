import 'package:flutter/material.dart';
import 'dart:math';

//https://www.geeksforgeeks.org/flutter-magic-8-ball-app/
class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //   title: const Text('Cat Facts!!'),
      // ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int answer = 0;
  final ball = [
    "Cats are believed to be the only mammals who don’t taste sweetness.",
    "Cats are nearsighted, but their peripheral vision and night vision are much better than that of humans.",
    "Cats are supposed to have 18 toes (five toes on each front paw; four toes on each back paw).",
    "Cats’ claws all curve downward, which means that they can’t climb down trees head-first. Instead, they have to back down the trunk.",
    "Cats’ collarbones don’t connect to their other bones, as these bones are buried in their shoulder muscles.",
    "Cats have 230 bones, while humans only have 206.",
    "Cats have an extra organ that allows them to taste scents on the air, which is why your cat stares at you with her mouth open from time to time.",
    "Cats have nearly twice the amount of neurons in their cerebral cortex as dogs."
  ];

  @override
  void randomAnswer() {
    setState(() {
      answer = Random().nextInt(8);
    });
  }

  String greeting =
      "More of a cat person? I don't have photos, but you can tap me for some cat facts!";

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            color: Colors.white,
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              // Launch
              onTap: () {
                randomAnswer();
              },

              title: Text(
                greeting,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal.shade900,
                ),
              ),
            ),
          ),
          Padding(
              child: Text(ball[answer], style: const TextStyle(fontSize: 20.0)),
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20))
        ],
      ),
    );
  }
}
