import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var coins = 100;
  var slotOne = 0;
  var slotTwo = 0;
  var slotThree = 0;
  var title = 'Spin to win';
  var coinsColor = Colors.white;
  var titleColor = Colors.lightBlueAccent;
  var random = Random();

  void spin() {
    coins -= 5;
    slotOne = random.nextInt(10);
    slotTwo = random.nextInt(10);
    slotThree = random.nextInt(10);
  }

  void score() {
    if (slotOne == 7 && slotTwo == 7 && slotThree == 7) {
      coins += 1000;
      title = 'WINNER 1000 COINS !!!!';
      coinsColor = Colors.greenAccent;
      titleColor = Colors.greenAccent;
    } else if (slotOne == slotTwo && slotOne == slotThree) {
      coins += 100;
      title = 'WINNER 100 COINS !!!!';
      coinsColor = Colors.greenAccent;
      titleColor = Colors.greenAccent;
    } else if (slotOne == slotTwo ||
        slotOne == slotThree ||
        slotTwo == slotThree) {
      coins += 10;
      title = 'WINNER 10 COINS !!!!';
      coinsColor = Colors.greenAccent;
      titleColor = Colors.greenAccent;
    } else {
      title = 'Sorry, spin again';
      coinsColor = Colors.redAccent;
      titleColor = Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Slot Game',
            style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 20.0,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          actions: [
            Text(
              'Coins:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0,
              ),
            ),
            Text(
              coins.toString(),
              style: TextStyle(
                color: coinsColor,
                fontSize: 20.0,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontFamily: 'SourceSansPro',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 10.0, right: 5.0, top: 20.0, bottom: 10.0),
                  color: Colors.white,
                  child: Text(
                    slotOne.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 10.0, right: 5.0, top: 20.0, bottom: 10.0),
                  color: Colors.white,
                  child: Text(
                    slotTwo.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 10.0, right: 5.0, top: 20.0, bottom: 10.0),
                  color: Colors.white,
                  child: Text(
                    slotThree.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            FlatButton(
              color: Colors.grey,
              child: Text(
                'SPIN',
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontFamily: 'SourceSansPro',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  spin();
                  score();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
