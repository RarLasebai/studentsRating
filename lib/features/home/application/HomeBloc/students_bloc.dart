// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_rating/features/home/data/repositories/student_repository_imp.dart';
import 'students_events.dart';
import 'students_states.dart';

class StudentsBloc extends Bloc<StudentsEvents, StudentsStates> {
  StudentsBloc() : super(StudentsInitialState());

  StudentRepositoryImp studentRepositoryImp = StudentRepositoryImp();
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();
  var students, student, count;
  bool? isRiot = false;

  @override
  Stream<StudentsStates> mapEventToState(StudentsEvents event) async* {
    try {
      if (event is GetStudentsEvent) {
        yield StudentsLoadingState();
        students = await studentRepositoryImp.getStudents();
        yield StudentLoadedState(students);
      }

      if (event is GetWeekGradesEvent) {
        yield StudentsLoadingState();
        students = await studentRepositoryImp.getWeekGrades();
        yield WeekGradesLoadedState(students);
      }

      if (event is UpdateStudentEvent) {
        yield StudentsLoadingState();
        count = await studentRepositoryImp.updateStudent(event.studentModel!);
        students = await studentRepositoryImp.getStudents();
        yield StudentLoadedState(students);
      }

      if (event is AddStudentEvent) {
        yield StudentsLoadingState();
        await studentRepositoryImp.addStudent(event.studentModel!);
        students = await studentRepositoryImp.getStudents();
        yield StudentLoadedState(students);
      }

      if (event is GetStarOfTheDayEvent) {
        yield StudentsLoadingState();
        student = await studentRepositoryImp.getStarOfTheDay();
        // print("stu $students");
        yield StarOfTheDayState(student);
      }
      if (event is ClacWeekGradeEvent) {
        yield StudentsLoadingState();
        count = await studentRepositoryImp.calcStudentWeekGrade(
            event.id, event.grade, event.weekGrade);
        students = await studentRepositoryImp.getStudents();
        yield StudentLoadedState(students);
        // print("stu $students");
        yield CalcWeekGradeDoneState();
      }

      if (event is ResetGradesEvent) {
        yield StudentsLoadingState();
        await studentRepositoryImp.resetStudentsGrades();
        students = await studentRepositoryImp.getStudents();
        yield StudentLoadedState(students);
      }
    } catch (e) {
      yield StudentErrorState(e.toString());
    }
  }
}
