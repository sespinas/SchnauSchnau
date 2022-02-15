import 'package:flutter/material.dart';
import 'business_card.dart';

import 'eight_ball.dart';
import 'schnau_schnau.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const MyHomePage(title: 'Schnau Schnau'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// Setting up TabBar in Flutter
// https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples/
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: Center(
                    child: Text(widget.title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white))),
                bottom: const TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25)), // Creates border
                      color: Colors.teal),
                  tabs: [
                    Tab(icon: Icon(Icons.face, color: Colors.white)),
                    Tab(icon: Icon(Icons.pets, color: Colors.white)),
                    Tab(icon: Icon(Icons.fact_check, color: Colors.white)),
                  ],
                )),
            body: TabBarView(
              children: [businessCard(), HomePage(), BallPage()],
            )));
  }
}
