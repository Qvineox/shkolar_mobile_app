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
