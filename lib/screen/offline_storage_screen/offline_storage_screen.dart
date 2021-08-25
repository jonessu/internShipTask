import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class OfflineStorageScreen extends StatefulWidget {
  OfflineStorageScreen({Key? key}) : super(key: key);

  @override
  _OfflineStorageScreenState createState() => _OfflineStorageScreenState();
}

class _OfflineStorageScreenState extends State<OfflineStorageScreen> {
  late Database database;
  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  initDatabase() async {
    if (database != null) {
      return database;
    }

    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'demo.db');
    print(path);

    await deleteDatabase(path);

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db
          .execute('CREATE TABLE TestDb (id INTEGER PRIMARY KEY, name TEXT)');
    });
    print(database);
  }

  void create() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            await database.transaction((txn) async {
              int id1 = await txn
                  .rawInsert('INSERT INTO TestDb(name) VALUES("some name")');
              print('inserted1: $id1');
              int id2 = await txn.rawInsert(
                  'INSERT INTO TestDb(name) VALUES(?)', ['another name']);
              print('inserted2: $id2');
            });
          },
          child: Text("djdlkjdl"),
        ),
      ),
    );
  }
}
