import 'package:flutter/material.dart';

import './dev_data.dart';
import 'particles/lesson_item.dart';

class LessonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Уроки')),
        body: ListView(
          children: DEV_LESSONS
              .map((lessonData) => LessonItem(lessonData))
              .toList(),
        ));
  }
}
