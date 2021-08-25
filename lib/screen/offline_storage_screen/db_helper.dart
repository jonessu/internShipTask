// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:intershiptasks/data/models/data_base_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:io' as io;
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

// class DBHelper {
//   static Database _db;
//   Future<Database> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await initDatabase();
//     return _db;
//   }

//   initDatabase() async {
//     io.Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, 'person.db');
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return db;
//   }

//   _onCreate(Database db, int version) async {
//     await db
//         .execute('CREATE TABLE person (id INTEGER PRIMARY KEY, name TEXT)');
//   }

//   Future<Person> add(Person name) async {
//     final dbClient = await db;
    
//     await dbClient.insert(
//     'persons',
//     person.toMap(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
//     return student;
//   }

//   Future<List<Student>> getStudents() async {
//     var dbClient = await db;
//     List<Map> maps = await dbClient.query('student', columns: ['id', 'name']);
//     List<Student> students = [];
//     if (maps.length > 0) {
//       for (int i = 0; i < maps.length; i++) {
//         students.add(Student.fromMap(maps[i]));
//       }
//     }
//     return students;
//   }

//   Future<int> delete(int id) async {
//     var dbClient = await db;
//     return await dbClient.delete(
//       'student',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   Future close() async {
//     var dbClient = await db;
//     dbClient.close();
//   }
// }
