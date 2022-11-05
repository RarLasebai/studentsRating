import 'package:students_rating/features/home/domain/entites/student.dart';

abstract class StudentsStates {}

class StudentsInitialState implements StudentsStates {}

class StudentsLoadingState implements StudentsStates {}

class StudentLoadedState implements StudentsStates {
  final List<Student>? students;
  StudentLoadedState(this.students);
}

class WeekGradesLoadedState implements StudentsStates {
  final List<Student>? students;
  WeekGradesLoadedState(this.students);
}

// class StudentUpdatedState implements StudentsStates {
//   final Student student;
//   StudentUpdatedState(this.student);
// }

// class StudentAddedState implements StudentsStates {
//   final List<Student>? students;
//   StudentAddedState(this.students);
// }

class StarOfTheDayState implements StudentsStates {
  final Student? student;
  StarOfTheDayState(this.student);
}

class CalcWeekGradeDoneState implements StudentsStates {}

class StudentErrorState implements StudentsStates {
  String message;
  StudentErrorState(this.message);
}
