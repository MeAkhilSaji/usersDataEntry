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
  bool hasReachedMax = false;
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
      hasReachedMax = false;
      userList.addAll(users);
      currentPage++;
    }

    emit(UserListingLoaded(userList: userList));
  }

  void searchUsers() async {
    Database db = await DatabaseHelper.instance.database;
    final users = await UserDataQueries.searchUsers(searchController.text, db);
    userList = [];
    userList.addAll(users);
    emit(UserListingLoaded(userList: users));
  }
}
