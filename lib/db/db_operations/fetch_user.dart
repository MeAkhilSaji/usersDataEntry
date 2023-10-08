part of '../user_data_queries.dart';

Future<List<User>> _getUsersPaged(int page, int pageSize, Database db) async {
  final List<Map<String, dynamic>> maps = await db.query(
    'users',
    limit: pageSize,
    offset: (page - 1) * pageSize,
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
