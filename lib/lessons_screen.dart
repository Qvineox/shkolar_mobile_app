import 'package:flutter/material.dart';
import 'package:shkolar_mobile_app/services/api_manager.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import 'api/api_provider.dart';
import 'api/data_classes.dart';
import 'particles/lesson_item.dart';

import 'package:http/http.dart' as http;

class WeekLessons extends StatefulWidget {
  @override
  _WeekLessonsPageState createState() => _WeekLessonsPageState();
}

class _WeekLessonsPageState extends State<WeekLessons> {
  Future<List<Lesson>> _lessonsModel;
  APIManager api = APIManager();

  @override
  void initState() {
    setState(() {
      _lessonsModel = api.fetchWeekLessons();
    });
    super.initState();
  }

  Future<void> _getData() async {
    setState(() {
      _lessonsModel = api.fetchWeekLessons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Расписание на неделю', style: TextStyle(fontSize: 22),)),
        body: FutureBuilder(
          future: _lessonsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                child: GroupedListView<dynamic, DateTime>(
                  elements: snapshot.data,
                  groupBy: (transaction) {
                    return transaction.date;
                  },
                  // start of new code
                  groupSeparatorBuilder: (DateTime date) =>
                      LessonsGroupSeparator(
                        date: date,
                      ),
                  // end of new code
                  order: GroupedListOrder.ASC,
                  itemBuilder: (context, dynamic lesson) =>
                      Card(child: LessonItem(lesson)),
                ),
                onRefresh: _getData,
              );
            } else {
              print(snapshot.data);
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

const weekdays = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье'];

class LessonsGroupSeparator extends StatelessWidget {
  final DateTime date;


  LessonsGroupSeparator({this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Text(
          "${this.date.day}/${this.date.month}/${this.date.year} ${weekdays[this.date.weekday - 1]}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
