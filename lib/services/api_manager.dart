import 'package:shkolar_mobile_app/api/api_provider.dart';
import 'package:shkolar_mobile_app/api/data_classes.dart';

class APIManager {
  ApiProvider _provider = ApiProvider();

  Future<List<Lesson>> fetchWeekLessons() async {
    final response = await _provider.get("week_lessons");

    List<Lesson> lessons = [];
    for (int i = 0; i < response.length; i++) {
      lessons.add(Lesson.fromJson(response[i]));
    }

    return lessons;
  }

  Future<Lesson> fetchLesson(int id) async {
    final response = await _provider.get("lesson/$id");
    Lesson _lesson = Lesson.fromJson(response);
    print(_lesson);

    return _lesson;
  }
}
