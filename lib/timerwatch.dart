import 'dart:async';
import 'dart:math';

//import 'package:clock_app/view/screen/homescreen.dart';
//import 'package:clock_app/view/screen/stopwatch.dart';
import 'package:flutter/material.dart';

class timer extends StatefulWidget {
  const timer({super.key});

  @override
  State<timer> createState() => _timerState();
}

int seconds=0,minutes=0;
bool isRunning=false;

class _timerState extends State<timer> {

  Future<void> stop() async {
    await Future.delayed(const Duration(seconds: 1),
            (){
          setState(() {
            if(minutes>0) {
              if (seconds == 0) {
                minutes--;
                seconds = 59;
              }
              else {
                seconds--;
              }
            }
          });
        }
    );
    if(isRunning)
      stop();
  }


  @override
  Widget build(BuildContext context) {
    String digitalseconds = seconds.toString().padLeft(2, '0');
    String digitalminutes = minutes.toString().padLeft(2, '0');


    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'TimerWatch',
                    style: TextStyle(color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 20,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                          height: 300,
                          width: 300,
                          child: CircularProgressIndicator(
                            value: (seconds)/(60),
                            strokeWidth: 10,
                            backgroundColor: Colors.black45,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                          )),
                      ...List.generate(
                          60,
                              (index) => Center(
                            child: Transform.rotate(
                              angle: index * 6 * pi / 180,
                              child: (index % 5 == 0)
                                  ? Divider(
                                indent: 315,
                                endIndent: 44,
                                thickness: 1,
                                color: Colors.grey.shade50,
                              )
                                  : Divider(
                                indent: 325,
                                endIndent: 44,
                                thickness: 1,
                                color: Colors.grey.shade50,
                              ),
                            ),
                          )),
                      Text(
                        ' $digitalminutes : $digitalseconds',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if(isRunning){
                      isRunning = false;
                      start();
                    } else {
                      isRunning = true;
                      stop();
                    };
                  },
                  child: Container(
                    height: 50,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black45,
                    ),
                    child: Text('Start',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () {
                            seconds=0;
                            minutes=2;
                            setState(() {
                            });
                          },
                          child:
                          Text('2 minutes',style: TextStyle(fontSize: 20,color: Colors.white),)),
                    ),
                    SizedBox(width: 30),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () {
                            seconds=0;
                            minutes=5;
                            setState(() {});
                          },
                          child: Text('5 minutes',style: TextStyle(fontSize: 20,color: Colors.white))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void start() {}
}