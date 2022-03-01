import 'package:flutter/material.dart';
import 'package:schnau_schnau/schnau_schnau.dart';

class SliderTutorial extends StatefulWidget {
  const SliderTutorial({Key? key}) : super(key: key);

  @override
  _SliderTutorialState createState() => _SliderTutorialState();
}

class _SliderTutorialState extends State<SliderTutorial> {
  int time = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Slideshow Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slider(
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
            value: time.toDouble(),
            onChanged: (value) {
              setState(() {
                time = value.toInt();
              });
            },
            min: 2,
            max: 100,
          ),
          Text(
            "Slideshow Interval: " + time.toString() + " seconds",
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ParsingWidget(
                      passedTime: time,
                    ),
                  ),
                );
              },
              child: const Text('Apply Change')),
        ],
      ),
    );
  }

  int sliderInterval() {
    return time;
  }
}
