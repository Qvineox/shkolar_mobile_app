import 'package:flutter/material.dart';

class Lesson {
  final int id;
  final String title;
  final String auditory;
  final String startDate;
  final String endDate;
  final String teacher;

  final Color color;

  const Lesson(
      {this.id = 0,
      this.title = 'Не указано',
      this.auditory = 'Не указано',
      this.startDate = 'Не указано',
      this.endDate = 'Не указано',
      this.teacher = 'Не указано',
      this.color = Colors.blueGrey});
}
