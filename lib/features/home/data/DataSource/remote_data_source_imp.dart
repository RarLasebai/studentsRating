import 'package:students_rating/features/home/domain/entites/fields.dart';

import 'students_database.dart';
import 'package:students_rating/features/home/data/DataSource/remote_data_source.dart';
import 'package:students_rating/features/home/data/model/student_model.dart';

class StudentRemoteDataSourceImp implements StudentRemoteDataSource {
  @override
  Future<List<StudentModel>> getStudents() async {
    final db = await StudentsDatabase.instance.database;
    final result = await db.rawQuery('''
  SELECT * FROM $studentTable ORDER BY "${StudentsFields.studentGrade}" DESC   
''');

    return result.map((json) => StudentModel.fromJson(json)).toList();
  }

  @override
  Future<StudentModel> addStudent(StudentModel studentModel) async {
    final db = await StudentsDatabase.instance.database;
    final id = await db.rawInsert('''insert into Students 
        ( ${StudentsFields.studentName}, ${StudentsFields.studentGrade}, ${StudentsFields.studentNote}, ${StudentsFields.isriot}) 
        values ( "${studentModel.studentName}", 0, "${studentModel.studentNote}", 0)''');
    // final id = await db.insert(studentTable, studentModel.toJson());

    return studentModel.copy(studentId: id);
  }

  @override
  Future<StudentModel> getStarOfTheDay() async {
    final db = await StudentsDatabase.instance.database;
    final result = await db.rawQuery('''
SELECT * FROM $studentTable where ${StudentsFields.studentGrade} = ( SELECT Max(${StudentsFields.studentGrade}) FROM $studentTable )

''');

    return StudentModel.fromJson(result.first);
  }

  @override
  Future calcStudentWeekGrade(int id, double grade, weekGrade) async {
    final db = await StudentsDatabase.instance.database;
    final result = await db.rawUpdate('''
update $studentTable set ${StudentsFields.studentGrade} = $grade,
 ${StudentsFields.studetnWeekGrade} =  $weekGrade + $grade
 where  ${StudentsFields.id} = $id
''');

    return result;
  }

  @override
  Future<List<StudentModel>> getWeekGrades() async {
    final db = await StudentsDatabase.instance.database;
    final result = await db.rawQuery('''
  SELECT * FROM $studentTable ORDER BY "${StudentsFields.studetnWeekGrade}" DESC   
''');

    return result.map((json) => StudentModel.fromJson(json)).toList();
  }

  @override
  Future resetStudentsGrades() async {
    final db = await StudentsDatabase.instance.database;
    await db.rawUpdate('''
 update $studentTable set ${StudentsFields.studentGrade} = 0,
 ${StudentsFields.studetnWeekGrade} = 0

''');
  }

  @override
  Future<int> updateStudent(StudentModel studentModel) async {
    final db = await StudentsDatabase.instance.database;
    return db.rawUpdate('''
 update $studentTable set 
 ${StudentsFields.studentName} = "${studentModel.studentName}", ${StudentsFields.studentNote} = "${studentModel.studentNote}", ${StudentsFields.isriot} = ${studentModel.isriot}
 where ${StudentsFields.id} = ${studentModel.studentId}
''');
  }
}
