import 'package:students_rating/features/home/data/model/student_model.dart';

abstract class StudentRemoteDataSource {
  const StudentRemoteDataSource();


  Future<List<StudentModel>> getStudents();
  // Future getDayGrades();
  Future<List<StudentModel>> getWeekGrades();
  Future<StudentModel> getStarOfTheDay();
  Future<StudentModel> addStudent(StudentModel studentModel);
  Future<int> updateStudent(StudentModel studentModel);
  Future resetStudentsGrades();
  Future calcStudentWeekGrade(int id, double grade, weekGrade);
  
}
