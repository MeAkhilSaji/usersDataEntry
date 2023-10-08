import 'package:sqflite/sqflite.dart';
import 'package:userdetails/models/user.dart';
part 'db_operations/insert_user.dart';
part 'db_operations/search_user.dart';
part 'db_operations/fetch_user.dart';
part 'db_operations/delete_db.dart';

class UserDataQueries {
  static Future<int> insertUser(User user, Database db) async =>
      await _insertUser(user, db);
  static Future<List<User>> searchUsers(String searchTerm, Database db) async =>
      await _searchUsers(searchTerm, db);
  static Future<List<User>> getUsersPaged(
          int page, int pageSize, Database db) async =>
      await _getUsersPaged(page, pageSize, db);

  static Future clearDatabase(String tbName, Database db) async =>
      clearDatabase(tbName, db);
}
