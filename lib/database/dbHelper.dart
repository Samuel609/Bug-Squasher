import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:digital_business_card/database/business_card.dart';

class dbHelper{
  static const int _version = 1;
  static const String _dbName = 'business_card.db';

  static Future<Database> _getDB() async{
    return openDatabase(join(await getDatabasesPath(), _dbName),
    onCreate: (db, version) async => 
    await db.execute(
      '''CREATE TABLE business_card(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    workArea TEXT,
    email TEXT,
    phoneNO TEXT,
    jobType TEXT,
    company TEXT
  )
'''
    ),
    version: _version
    );
  }

  static Future<int> addCard(Business_card business_card) async{
    final db = await _getDB();
    return await db.insert('business_card', business_card.tojson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateCard(Business_card business_card) async{
    final db = await _getDB();
    return await db.update('business_card', business_card.tojson(), 
    where: 'id = ?', 
    whereArgs: [business_card.id], 
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteCard(Business_card business_card) async{
    final db = await _getDB();
    return await db.delete('business_card',
    where: 'id = ?', 
    whereArgs: [business_card.id], );
  }

  static Future<List<Business_card>?> getAllCard() async{
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("business_card");

    if(maps.isEmpty){
      return null;
    }
    return List.generate(maps.length, (index) => Business_card.fromJson(maps[index]));
  }
}