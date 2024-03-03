import 'dart:async';

import 'package:clock_app/clock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(stopwatch());
}

class stopwatch extends StatefulWidget {
  const stopwatch({super.key});

  @override
  State<stopwatch> createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {
  Stopwatch stop = Stopwatch();
  String millisec = '00';
  String sec = '00';
  String min = '00';

  startWatch() {
    stop.start();
    Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {
        var milli = stop.elapsed.inMilliseconds;

        millisec = (milli % 1000).toString().padLeft(2, '0');
        sec = ((milli ~/ 1000) % 60).toString().padLeft(2, '0');
        min = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, '0');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,actions: [InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/timer');
          },
          child: Icon(Icons.arrow_forward,size: 25,color: Colors.black87,))],
        title: Text(
          'StopWatch',
          style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ('$min: $sec:  $millisec'),
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(

                  onTap: () {
                    startWatch();
                  },
                  child: Container(
                    height: 53,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade800),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'Start',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    stop.stop();
                  },
                  child: Container(
                    height: 53,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade800),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30,top: 3),
                      child: Text(
                        'Stop',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                stop.reset();
              },
              child: Container(
                height: 53,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.shade800),
                child: Padding(
                  padding: const EdgeInsets.only(left: 27,top: 3),
                  child: Text(
                    'Restart',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}