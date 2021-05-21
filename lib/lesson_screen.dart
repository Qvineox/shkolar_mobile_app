import 'package:flutter/material.dart';
import 'package:shkolar_mobile_app/models/lesson.dart';

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // получение данных через навигатор как сущность класса Lesson
    final lessonData = ModalRoute.of(context).settings.arguments as Lesson;

    return Scaffold(
        appBar: AppBar(title: Text(lessonData.title)),
        body: Center(
          child: Text('Страница урока!'),
        ));
  }
}
