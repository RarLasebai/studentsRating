import 'package:students_rating/features/home/data/model/student_model.dart';
import 'package:students_rating/features/home/domain/entites/student.dart';

abstract class StudentRepository {
  const StudentRepository();

  Future<List<Student>> getStudents();
  // Future getDayGrades();
  Future<List<Student>> getWeekGrades();
  Future<Student> getStarOfTheDay();
  Future<Student> addStudent(StudentModel studentModel);
  Future updateStudent(StudentModel studentModel);
  Future resetStudentsGrades();
  Future calcStudentWeekGrade(int id, double grade, weekGrade);
}
