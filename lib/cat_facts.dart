import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
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
  @override
  String result1 = 'Are you ready for these facts!?!?!';
  bool isLoading = false;

  Future<List<String>> extractData() async {
    // Getting the response from the targeted url
    final response = await http.Client()
        .get(Uri.parse('https://cs361-cat-factz.herokuapp.com/catfactsapi'));

    // Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {
      // Getting the html document from the response
      var document = parser.parse(response.body);
      try {
        // Scraping the first article title
        var responseString1 = document.getElementsByTagName('body')[0];

        // For debugging, DELETE ME BEFORE PUBLISH
        print(responseString1.text.trim());

        return [
          responseString1.text.trim(),
        ];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
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
              onTap: () async {
                //Setting isLoading true to show the loader
                setState(() {
                  isLoading = true;
                });

                //Awaiting for web scraping function to return list of strings
                final response = await extractData();

                //Setting the received strings to be displayed and making isLoading false to hide the loader
                setState(() {
                  result1 = response[0];

                  isLoading = false;
                });
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
              child: Text(result1, style: const TextStyle(fontSize: 20.0)),
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20)),
        ],
      ),
    );
  }
}
