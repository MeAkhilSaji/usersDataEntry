import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:userdetails/db/database_helper.dart';
import 'package:userdetails/db/user_data_queries.dart';
import 'package:userdetails/models/user.dart';

part 'user_listing_state.dart';

class UserListingCubit extends Cubit<UserListingState> {
  UserListingCubit() : super(UserListingInitial()) {
    loadUsers();
  }
  final TextEditingController searchController = TextEditingController();
  int currentPage = 1;
  bool hasReachedMax = true;
  int pageSize = 10;
  List<User> userList = [];
  void loadUsers() async {
    print("calless");
    Database db = await DatabaseHelper.instance.database;
    final users =
        await UserDataQueries.getUsersPaged(currentPage, pageSize, db);
    if (users.isEmpty) {
      hasReachedMax = true;
    } else {
      userList.addAll(users);
      currentPage++;
    }

    emit(UserListingLoaded(userList: userList));
  }

  void searchUsers() async {
    print("hh");
    Database db = await DatabaseHelper.instance.database;
    final users = await UserDataQueries.searchUsers(searchController.text, db);
    print(users);
    userList = [];
    userList.addAll(users);
    emit(UserListingLoaded(userList: users));
  }
}
