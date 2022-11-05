import 'package:students_rating/features/home/data/model/student_model.dart';

abstract class StudentsEvents {}

class GetStudentsEvent implements StudentsEvents {}

class GetWeekGradesEvent implements StudentsEvents {}

class UpdateStudentEvent implements StudentsEvents {
  StudentModel? studentModel;
  UpdateStudentEvent(this.studentModel);
}

class AddStudentEvent implements StudentsEvents {
  StudentModel? studentModel;
  AddStudentEvent(this.studentModel);
}

class GetStarOfTheDayEvent implements StudentsEvents {}

class ResetGradesEvent implements StudentsEvents {}

class ClacWeekGradeEvent implements StudentsEvents {
  int id;
  double grade, weekGrade;
  ClacWeekGradeEvent(this.id, this.grade, this.weekGrade);
}
