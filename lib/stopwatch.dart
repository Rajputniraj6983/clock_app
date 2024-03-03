import 'dart:async';

import 'package:clock_app/clock.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(stopwatch());
}
class stopwatch extends StatefulWidget {
  const stopwatch({super.key});

  @override
  State<stopwatch> createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1),(Timer) {
      setState(() {
        dateTime=DateTime.now();
      });
    });
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
         appBar: AppBar(
           backgroundColor: Colors.white60,
           centerTitle: true,
             title: Text('StopWatch',style: TextStyle(color:Colors.grey.shade700,fontSize: 35,fontWeight: FontWeight.bold),),
         ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(('${dateTime.hour}: ${dateTime.minute}:  ${dateTime.second}'),style: TextStyle(color: Colors.red,fontSize: 25),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(onTap: (){},
                  child: Container(height: 53,width: 130,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.green),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Text('Start',style: TextStyle(color: Colors.white,fontSize: 40),),
                    ),
                  ),
                ),InkWell(onTap:      (){},
                  child: Container(height: 53,width: 130,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.red),
                     child: Padding(
                       padding: const EdgeInsets.only(left: 22),
                       child: Text('Stop',style: TextStyle(color: Colors.white,fontSize: 40),),
                     ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            InkWell(onTap: (){},
              child: Container(height: 53,width: 160,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.yellowAccent.shade700),
                child: Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Text('Restart',style: TextStyle(color: Colors.white,fontSize: 40),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
