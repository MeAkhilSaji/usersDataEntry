part of '../user_data_queries.dart';

Future<int> _insertUser(User user, Database db) async {
  return await db.insert('users', user.toMap());
}
