import 'package:path/path.dart';
import 'package:ppkdb3/tugas11/model/cacatan.dart';
import 'package:ppkdb3/tugas11/model/user.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  // =====================================================
  // INITIAL DATABASE
  // =====================================================
  static Future<Database> databaseHelper() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'login.db'),
      onCreate: (db, version) async {
        // Buat tabel users
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, password TEXT, name TEXT)',
        );

        // Buat tabel catatan
        await db.execute(
          'CREATE TABLE catatan(id INTEGER PRIMARY KEY, namaPeserta TEXT, email TEXT, namaEvent TEXT, asalKota TEXT)',
        );
      },
      version: 2,
    );
  }

  // =====================================================
  // USERS TABLE
  // =====================================================

  static Future<void> registerUser(User user) async {
    final db = await databaseHelper();
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> updateUser(User user) async {
    final db = await databaseHelper();
    await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteUser(int id) async {
    final db = await databaseHelper();
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  static Future<User?> loginUser(String email, String password) async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return User.fromMap(results.first);
    }
    return null;
  }

  static Future<List<User>> getAllUsers() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('users');
    return results.map((e) => User.fromMap(e)).toList();
  }

  // =====================================================
  // CATATAN TABLE
  // =====================================================

  static Future<void> insertCatatan(Catatan catatan) async {
    final db = await databaseHelper();
    await db.insert(
      'catatan',
      catatan.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> updateCatatan(Catatan catatan) async {
    final db = await databaseHelper();
    await db.update(
      'catatan',
      catatan.toMap(),
      where: 'id = ?',
      whereArgs: [catatan.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<Catatan?> getCatatanById(int id) async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query(
      'catatan',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return Catatan.fromMap(results.first);
    }
    return null;
  }

  static Future<List<Catatan>> getAllCatatan() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('catatan');
    return results.map((e) => Catatan.fromMap(e)).toList();
  }

  static Future<void> deleteCatatan(int id) async {
    final db = await databaseHelper();
    await db.delete('catatan', where: 'id = ?', whereArgs: [id]);
  }
}
