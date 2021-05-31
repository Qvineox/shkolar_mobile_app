import 'package:flutter/material.dart';
import 'package:shkolar_mobile_app/services/api_manager.dart';

import '../api/data_classes.dart';

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lessonData = ModalRoute.of(context).settings.arguments as Lesson;

    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${lessonData.subject} (${lessonData.date.day}/${lessonData.date.month})')),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Text('Преподаватель',
                        style: Theme.of(context).textTheme.bodyText1),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('${lessonData.teacher}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                  ]),
                  TableRow(children: [
                    Text('Группа', style: Theme.of(context).textTheme.bodyText1),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('${lessonData.studyGroup}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                  ]),
                  TableRow(children: [
                    Text('Дата занятия',
                        style: Theme.of(context).textTheme.bodyText1),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          '${lessonData.date.day}.${lessonData.date.month}.${lessonData.date.year}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                  ]),
                  TableRow(children: [
                    Text('Аудитория',
                        style: Theme.of(context).textTheme.bodyText1),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          '${lessonData.auditory != null ? lessonData.auditory : 'Не указана'}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                  ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        'Домашнее задание',
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ],),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                    '${lessonData.homework != null ? lessonData.homework : 'Не задано'}',
                    style: TextStyle(fontSize: 18)),
              ),
            ],
          )),
    );
  }
}
