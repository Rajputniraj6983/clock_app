
import 'package:clock_app/clock.dart';
import 'package:clock_app/stopwatch.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(clock1());
}
class clock1 extends StatefulWidget {
  const clock1({super.key});

  @override
  State<clock1> createState() => _clock1State();
}

class _clock1State extends State<clock1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/stopwatch',
        routes: {
           '/':(context) => clock(),
          '/stop':(context) => stopwatch(),
        },
      );
  }
}
