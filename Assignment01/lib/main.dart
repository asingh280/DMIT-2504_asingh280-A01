// ignore_for_file: use_key_in_widget_constructors, todo

import 'dart:math';

import 'package:flutter/material.dart';

//https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e

//This app makes use of the Row, Column,
//Expanded, Padding, Transform, Container,
//BoxDecoration, BoxShape, Colors,
//Border, Center, Align, Alignment,
//EdgeInsets, Text, and TextStyle Widgets

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //first level widget of Material Design
      home: Scaffold(
        //default route
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("App1 - UI Layout"),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Container 1
                Container(
                  height: 100.0,
                  width: 100.0,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(color: Colors.black, width: 3.0),
                  ),
                  child: const Center(
                    child: Text('Container1'),
                  ),
                ),
                const SizedBox(height: 20),
                // Container 2
                Transform.rotate(
                  angle: pi / 4,
                  origin: const Offset(20, -8),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text('Container 2'),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: 100.0,
                      color: Colors.yellow,
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('Container 3'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: 100.0,
                      color: Colors.lightBlue,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text('Container 4'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Container 5 (Circle)
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Container 5',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 150),
                // Container 6
                Container(
                  height: 300.0,
                  width: 100.0,
                  // padding: const EdgeInsets.all(0),
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Con 6',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
