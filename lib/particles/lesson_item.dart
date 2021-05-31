import 'package:flutter/material.dart';
import 'package:shkolar_mobile_app/api/data_classes.dart';
import 'package:shkolar_mobile_app/pages/lesson_screen.dart';

class LessonItem extends StatelessWidget {
  final Lesson _lessonData;

  LessonItem(this._lessonData);

  void viewLesson(BuildContext context, lessonData) {
    Navigator.of(context).pushNamed('/lesson', arguments: lessonData);
  }

  @override
  Widget build(BuildContext context) {
    if (_lessonData.homework != null) {
      return ListTile(
        trailing: Icon(Icons.bookmark_outline),
        title: Text(
          _lessonData.subject,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
            '${_lessonData.teacher}\nАуд. ${_lessonData.auditory != null ? _lessonData.auditory : 'не указана.'}',
            style: Theme.of(context).textTheme.bodyText2),
        isThreeLine: true,
        onTap: () => viewLesson(context, _lessonData),
      );
    } else {
      return ListTile(
        title: Text(
          _lessonData.subject,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
            '${_lessonData.teacher}\nАуд. ${_lessonData.auditory != null ? _lessonData.auditory : 'не указана.'}',
            style: Theme.of(context).textTheme.bodyText2),
        isThreeLine: true,
        onTap: () => viewLesson(context, _lessonData),
      );
    }
  }
}
