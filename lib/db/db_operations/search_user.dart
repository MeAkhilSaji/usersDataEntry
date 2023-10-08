part of '../user_data_queries.dart';

Future<List<User>> _searchUsers(String searchTerm, Database db) async {
  final List<Map<String, dynamic>> maps = await db.query(
    'users',
    where:
        'username LIKE ? OR country LIKE ? OR gender LIKE ? OR dateOfBirth LIKE ?',
    whereArgs: List.generate(4, (_) => '%$searchTerm%'),
  );
  return List.generate(maps.length, (i) {
    return User(
      username: maps[i]['username'],
      country: maps[i]['country'],
      gender: maps[i]['gender'],
      dateOfBirth: maps[i]['dateOfBirth'],
      imageFilePath: maps[i]['imageFilePath'],
    );
  });
}
