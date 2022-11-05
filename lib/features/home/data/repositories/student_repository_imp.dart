import 'package:students_rating/features/home/data/DataSource/remote_data_source_imp.dart';
import 'package:students_rating/features/home/data/model/student_model.dart';
import 'package:students_rating/features/home/domain/entites/student.dart';
import 'package:students_rating/features/home/domain/repositories/student_repository.dart';

class StudentRepositoryImp implements StudentRepository {
  StudentRemoteDataSourceImp sourceImp = StudentRemoteDataSourceImp();

  @override
  Future<Student> addStudent(StudentModel studentModel) async {
    return await sourceImp.addStudent(studentModel);
  }

  @override
  Future<Student> getStarOfTheDay() async {
    return await sourceImp.getStarOfTheDay();
  }

  @override
  Future<List<Student>> getStudents() async {
    return await sourceImp.getStudents();
  }

  @override
  Future calcStudentWeekGrade(int id, double grade, weekGrade) async {
    return await sourceImp.calcStudentWeekGrade(id, grade, weekGrade);
  }

  @override
  Future<List<Student>> getWeekGrades() async {
    return await sourceImp.getWeekGrades();
  }

  @override
  Future resetStudentsGrades() async {
    return await sourceImp.resetStudentsGrades();
  }

  @override
  Future updateStudent(StudentModel studentModel) async {
    return await sourceImp.updateStudent(studentModel);
  }
}
