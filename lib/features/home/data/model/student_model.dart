import 'package:students_rating/features/home/domain/entites/fields.dart';
import 'package:students_rating/features/home/domain/entites/student.dart';

class StudentModel extends Student {
  StudentModel(
      {int? studentId,
      String? studentName,
      double? studentGrade,
      String? studentNote,
      double? studentWeekGrade,
      int? isriot})
      : super(
            studentId: studentId,
            studentName: studentName,
            studentGrade: studentGrade,
            studentNote: studentNote,
            isriot: isriot,
            studentWeekGrade: studentWeekGrade);
  StudentModel copy(
          {int? studentId,
          String? studentName,
          double? studentGrade,
          String? studentNote,
          double? studentWeekGrade,
          int? isriot}) =>
      StudentModel(
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        studentGrade: studentGrade ?? this.studentGrade,
        studentNote: studentNote ?? this.studentNote,
        studentWeekGrade: studentWeekGrade ?? this.studentWeekGrade,
        isriot: isriot ?? this.isriot
      );

  StudentModel.fromJson(Map<String, dynamic> json)
      : super(
            studentId: json[StudentsFields.id] as int,
            studentName: json[StudentsFields.studentName] as String,
            studentGrade: json[StudentsFields.studentGrade] as double,
            studentNote: json[StudentsFields.studentNote] as String,
            isriot: json[StudentsFields.isriot] as int,
            studentWeekGrade: json[StudentsFields.studetnWeekGrade] as double?
            );

  Map<String, dynamic> toJson() => {
        StudentsFields.id: studentId,
        StudentsFields.studentName: studentName,
        StudentsFields.studentGrade: studentGrade,
        StudentsFields.studentNote: studentNote,
        StudentsFields.studetnWeekGrade: studentWeekGrade,
        StudentsFields.isriot: isriot,

        // final Map<String, dynamic> data = <String, dynamic>{};
        // data['student_id'] = studentId;
        // data['student_name'] = studentName;
        // data['student_grade'] = studentGrade;
        // data['student_note'] = studentNote;
        // data['student_week_grade'] = studentWeekGrade;
        // data['riot'] = isriot;
        // return data;
      };
}
