
import 'dart:async';
import 'dart:math';

import 'package:clock_app/stopwatch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class clock extends StatefulWidget {
  const clock({super.key});

  @override
  State<clock> createState() => _clockState();
}
DateTime dateTime=DateTime.now();
class _clockState extends State<clock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1),(timer){
      setState(() {
        dateTime=DateTime.now();
      });
    });
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text('Clock App',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('   Hours:Minutes:Seconds',style: TextStyle(color: Colors.grey.shade700,fontSize: 18,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${dateTime.hour}: ${dateTime.minute}:  ${dateTime.second}',style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                  Text((dateTime.hour<=12)?' PM':' AM',style: TextStyle(color: Colors.white,fontSize: 35),),
                ],
              ),
              //  Text('Date:Months:Year',style: TextStyle(color: Colors.grey.shade700,fontSize: 18,),),
            //  Text('${dateTime.day}: ${dateTime.month}:${dateTime.year}',style: TextStyle(color: Colors.grey.shade700,fontSize: 30,fontWeight: FontWeight.bold),),
              // Text('${dateTime.weekday}',style: TextStyle(color: Colors.grey.shade700,fontSize: 30,fontWeight: FontWeight.bold),)
              Container(
                alignment: Alignment.center,
                height: 250,
                decoration: BoxDecoration(color: Colors.grey.shade100,shape: BoxShape.circle),
                child: Stack(
                  children: [
                    ...List.generate(60,(index) => Transform.rotate(angle: index * 12 * pi/360,
                      child: Center(

                        child: (index%5==0)?Divider(
                          endIndent: 290, //(index%5==0)?300:305,
                          indent: 71,
                          thickness: 2,
                          color: Colors.red,
                        ):
                        Divider(
                          endIndent: 300, //(index%5==0)?300:305,
                          indent: 71,
                          thickness: 2,
                        ),
                      ),
                    )
                    ),
                    Center(child: CircleAvatar(radius: 10),),
                    Center(
                      child: Transform.rotate(
                        angle: dateTime.second * 6 * pi / 180,
                        child: VerticalDivider(
                          thickness: 2,
                          indent: 30,
                          endIndent: 105,
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: dateTime.minute * 6 * pi / 180,
                        child: VerticalDivider(
                          thickness: 2,
                          indent: 20,
                          endIndent: 105,
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: (dateTime.hour%12+dateTime.minute/60) * 30 * pi / 180,
                        child: VerticalDivider(
                          thickness: 4,
                          indent: 45,
                          endIndent: 105,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100,left: 60),
                child: Row(
                  children: [
                    Icon(Icons.location_on,size: 35,color: Colors.white,),
                    Text(" Gujarat,(India)",style: TextStyle(color: Colors.white,fontSize: 30),),
                  ],
                ),
              ),
              SizedBox(height: 50),
              IconButton(onPressed: (){
                Navigator.pushNamed(context, '/stop');
              },
                icon: Icon(Icons.alarm,size: 80,color: Colors.white,),)
            ],
          ),
        ),
    );
  }
}

