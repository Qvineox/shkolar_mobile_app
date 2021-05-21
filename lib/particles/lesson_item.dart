import 'package:flutter/material.dart';
import 'package:shkolar_mobile_app/lesson_screen.dart';
import 'package:shkolar_mobile_app/models/lesson.dart';

class LessonItem extends StatelessWidget {
  final Lesson _lessonData;

  LessonItem(this._lessonData);

  void viewLesson(BuildContext context, lessonData) {
    Navigator.of(context).pushNamed('/lesson', arguments: lessonData);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _lessonData.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text('${_lessonData.teacher}\nАуд. ${_lessonData.auditory}',
          style: Theme.of(context).textTheme.bodyText2),
      isThreeLine: true,
      onTap: () => viewLesson(context, _lessonData),
    );
  }
}
