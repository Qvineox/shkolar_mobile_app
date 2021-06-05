import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shkolar_mobile_app/pages/lesson_screen.dart';
import 'package:shkolar_mobile_app/pages/login_screen.dart';
import 'package:shkolar_mobile_app/services/change_notificator.dart';

import 'api/data_classes.dart';
import 'pages/lessons_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'ShkolarApp',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(126, 138, 172, 1),
            accentColor: Color.fromRGBO(255, 230, 178, 1),
            fontFamily: 'IBMPlex',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(120, 120, 120, 1)),
                bodyText2: TextStyle(
                    fontSize: 13, color: Color.fromRGBO(120, 120, 120, 1)),
                headline6:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w400))),
        home: WeekLessons(),
        routes: {
          '/lesson': (context) => LessonScreen(),
          '/login': (context) => new LoginScreen()
        },
      ),
    );
  }
}
