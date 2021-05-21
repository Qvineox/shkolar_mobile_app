import 'package:flutter/material.dart';
import 'package:shkolar_mobile_app/lesson_screen.dart';

import 'lessons_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShkolarApp',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(126, 138, 172, 1),
          accentColor: Color.fromRGBO(255, 230, 178, 1),
          fontFamily: 'IBMPlex',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(51, 51, 51, 1)),
              bodyText2: TextStyle(
                  fontSize: 13, color: Color.fromRGBO(120, 120, 120, 1)),
              headline6: TextStyle(fontSize: 24, fontWeight: FontWeight.w400))),
      home: LessonsScreen(),
      routes: {'/lesson': (context) => LessonScreen()},
    );
  }
}
