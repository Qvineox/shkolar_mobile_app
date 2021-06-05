import 'package:shared_preferences/shared_preferences.dart';

class Lesson {
  final int id;
  final bool isActive;
  final DateTime date;
  final int order;
  final String subject;
  final String teacher;
  final String auditory;
  final String studyGroup;
  final String homework;

  Lesson(
      {this.isActive,
      this.date,
      this.order,
      this.subject,
      this.teacher,
      this.auditory,
      this.id,
      this.studyGroup,
      this.homework});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      date: DateTime.parse(json['date']),
      isActive: json['active'],
      subject: json['subject'],
      teacher: json['teacher'],
      auditory: json['auditory'],
      studyGroup: json['study_group'],
      homework: json['homework'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['active'] = this.isActive;
    data['subject'] = this.subject;
    data['teacher'] = this.teacher;
    data['auditory'] = this.auditory;
    if (this.studyGroup != null) {
      data['study_group'] = this.studyGroup;
    }
    if (this.homework != null) {
      data['homework'] = this.homework;
    }

    return data;
  }
}

class User {
  int userId;
  String firstName;
  String lastName;
  String middleName;
  String email;
  String phone;
  String token;

  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.middleName,
    this.email,
    this.phone,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      middleName: json['middle_name'],
      email: json['email'],
      phone: json['phone'],
      token: json['access_token'],
    );
  }
}

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.userId);
    prefs.setString("firstName", user.firstName);
    prefs.setString("lastName", user.lastName);
    prefs.setString("middleName", user.middleName);
    prefs.setString("email", user.email);
    prefs.setString("phone", user.phone);
    prefs.setString("token", user.token);

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId");
    String firstName = prefs.getString("firstName");
    String lastName = prefs.getString("lastName");
    String middleName = prefs.getString("middleName");
    String email = prefs.getString("email");
    String phone = prefs.getString("phone");
    String token = prefs.getString("token");

    return User(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        email: email,
        phone: phone,
        token: token);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("userId");
    prefs.remove("firstName");
    prefs.remove("lastName");
    prefs.remove("middleName");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("token");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
