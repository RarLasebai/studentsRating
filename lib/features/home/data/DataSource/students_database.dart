import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/entites/fields.dart';

class StudentsDatabase {
  static final StudentsDatabase instance = StudentsDatabase._init();
  static Database? _database;

  StudentsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("students.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE IF NOT EXISTS $studentTable (
  ${StudentsFields.id}  INTEGER PRIMARY KEY AUTOINCREMENT,
  ${StudentsFields.studentName} TEXT NOT NULL,
  ${StudentsFields.studentGrade} DOUBLE NOT NULL,
  ${StudentsFields.studentNote} TEXT,
  ${StudentsFields.studetnWeekGrade} DOUBLE,
  ${StudentsFields.isriot} INTEGER NOT NULL
)
''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
