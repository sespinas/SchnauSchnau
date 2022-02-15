import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// https://nanocastellano.medium.com/business-card-on-flutter-f9e311de2cda
// Business card in flutter

Widget phoneCard() {
  return Card(
    color: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      // Launch
      onTap: () {
        launch('sms:15417374411');
      },
      leading: const Icon(
        Icons.phone,
        color: Colors.teal,
      ),
      title: Text(
        '+1 541 737 4411',
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Source Sans Pro',
          color: Colors.teal.shade900,
        ),
      ),
    ),
  );
}

Widget emailCard() {
  return Card(
    color: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      onTap: () {
        launch('mailto:espinassg@oregonstate.edu');
      },
      leading: const Icon(
        Icons.email,
        color: Colors.teal,
      ),
      title: Text(
        'espinass@oregonstate.edu',
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Source Sans Pro',
          color: Colors.teal.shade900,
        ),
      ),
    ),
  );
}

Widget gitCard() {
  return Card(
    color: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      onTap: () {
        launch('https://github.com/sespinas');
      },
      leading: const Icon(
        Icons.web_asset,
        color: Colors.teal,
      ),
      title: Text(
        'My Git',
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Source Sans Pro',
          color: Colors.teal.shade900,
        ),
      ),
    ),
  );
}

Widget businessCard() {
  return Scaffold(
    backgroundColor: Colors.teal,
    body: SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 75.0,
              backgroundImage: ExactAssetImage('images/0.jpeg'),
            ),
            const Text(
              'Sebastian Espinas',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10.0, left: 22, right: 22),
                child: Text(
                  'Welcome to my Schnau Schnau app! You can either view my Schnauzer slideshow or get your dose of cat facts. Enjoy!',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    // letterSpacing: 2.5,
                    color: Colors.teal.shade100,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Text(
                  'Version 1.1 updates:\n- Added Schnauzers\n- Added Schnauzers\n- Added Schnauzers\n- Added Schnauzers',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 15.0,
                    letterSpacing: 2.5,
                    color: Colors.teal.shade100,
                    // fontWeight: FontWeight.bold,
                  ),
                )),
            phoneCard(),
            emailCard(),
            gitCard()
          ]),
    ),
  );
}
