import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:userdetails/Data_listing_screen/cubit/user_listing_cubit.dart';
import 'package:userdetails/core/core_ui.dart';
import 'package:userdetails/db/database_helper.dart';
import 'package:userdetails/db/user_data_queries.dart';
import 'package:userdetails/models/user.dart';

part 'components/serach_section.dart';
part 'components/listviewing_builder.dart';
part 'components/listviewing_element.dart';

class UserDataList extends StatelessWidget {
  const UserDataList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListingCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("User List")),
          ),
          body: const UserDataListFrame()),
    );
  }
}

class UserDataListFrame extends StatefulWidget {
  const UserDataListFrame({super.key});
  @override
  State<UserDataListFrame> createState() => _UserDataListFrameState();
}

class _UserDataListFrameState extends State<UserDataListFrame> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        BlocProvider.of<UserListingCubit>(context).hasReachedMax = false;
        BlocProvider.of<UserListingCubit>(context).loadUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListingCubit, UserListingState>(
      builder: (context, state) {
        if (state is UserListingInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            const SearchSection(),
            Expanded(
                child:
                    UsersListingBuilder(scrollController: _scrollController)),
          ],
        );
      },
    );
  }
}
