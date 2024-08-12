import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite; // Import the sqflite package
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'fav.db'),
      onCreate: (db, version) async {
        await createTable(db, 'ayat',
            'id INTEGER PRIMARY KEY, surahIndex INTEGER, AyaIndex INTEGER');
        await createTable(db, 'azkar',
            'id INTEGER PRIMARY KEY, zakerIndex INTEGER, category TEXT');
        await createTable(
            db, 'surah', 'id INTEGER PRIMARY KEY, surahIndex INTEGER');
      },
      version: 2,
    );
  }

  Future<void> createTable(
      Database db, String tableName, String tableDefinition) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS $tableName($tableDefinition)',
    );
  }

  Future<void> insert(Map<String, dynamic> data, String table) async {
    final db = await database;
    await db
        .insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      print('Data inserted');
    }).catchError((error) {
      print('Error inserting data: $error');
    });
  }

  Future<List<Map<String, dynamic>>> queryAllFromTable(String table) async {
    final db = await database;
    return db.query(table);
  }

  Future<void> delete(String table,
      {required String column, required dynamic value}) async {
    final db = await database;
    await db.delete(
      table,
      where: '$column = ?',
      whereArgs: [value],
    );
  }

  Future<List<Map<String, dynamic>>> query(String table,
      {String? where, List<dynamic>? whereArgs}) async {
    final db = await database;
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  // New method to delete the database
  Future<void> deleteDatabase() async {
    final dbPath = join(await getDatabasesPath(), 'fav.db');
    await sqflite.deleteDatabase(dbPath);
    _database = null; // Reset the database instance
  }
}
