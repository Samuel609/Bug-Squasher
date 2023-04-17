import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLhelper{
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''
  CREATE TABLE business_card(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    workArea TEXT,
    email TEXT,
    phoneNO TEXT,
    jobType TEXT,
    company TEXT
  )
''');
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase(
      'database.db',
      version: 1,
      onCreate: (sql.Database database, int version) async{
        await createTables(database);
      }
    );
  }

  static Future<int> createUser(
    String workArea, String email, int phoneNO, String jobType, String company,) async{
      final db = await SQLhelper.db();

      final data = {
        'workArea': workArea, 
        'email': email,
        'phoneNO': phoneNO, 
        'jobType': jobType, 
        'company': company
        };
      final id = await db.insert('business_card', 
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
      return id;
    }

    static Future<List<Map<String, dynamic>>> getCards() async{
      final db = await SQLhelper.db();
      return db.query('business_card', orderBy: "id");
    }

    static Future<List<Map<String, dynamic>>> getCard(int id) async{
      final db = await SQLhelper.db();
      return db.query('business_card', where: "id = ?", whereArgs: [id], limit: 1);
    }

    static Future<int> updateCard(
    int id, String workArea, String email, int phoneNO, String jobType, String company,) async{
      final db = await SQLhelper.db();

      final data = {
        'workArea': workArea, 
        'email': email, 
        'phoneNO': phoneNO,
        'jobType': jobType, 
        'company': company
        };

        final result = await db.update('business_card', data, where: "id = ? ", whereArgs: [id]);
        return result;
    }

    static Future<void> deleteCard(int id) async{
      final db = await SQLhelper.db();
      try{
        await db.delete("business_card", where: "id = ?", whereArgs: [id]);
      }
      catch (err){
        debugPrint("something went wrong when deleting an item: $err");
      }
    }
}