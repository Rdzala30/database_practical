import 'package:sqflite/sqflite.dart';
import 'user_model.dart';
import 'database_helper.dart';

class UserRepository {
  final dbHelper = DatabaseHelper.instance;

  Future<int> insertUser(User user) async {
    Database db = await dbHelper.database;
    return await db.insert('users', user.toMap());
  }

  Future<List<User>> getUsers() async {
    Database db = await dbHelper.database;
    List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  Future<int> updateUser(User user) async {
    Database db = await dbHelper.database;
    return await db.update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<int> deleteUser(int id) async {
    Database db = await dbHelper.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
