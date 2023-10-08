import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:userdetails/core/core_ui.dart';
import 'package:userdetails/db/database_helper.dart';
import 'package:userdetails/db/user_data_queries.dart';
import 'package:userdetails/models/user.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  final TextEditingController usernameController = TextEditingController();
  String selectedGender = '';
  DateTime selectedDate = DateTime.now();
  List<String> countries = ["India", "USA", "UK"];
  List<String> selectedCountries = [];
  File? image;
  FocusNode focusNode = FocusNode();

//country selection
  chnageCountries(bool value, String country) {
    emit(UserDataInitial());
    focusNode.unfocus();
    selectedCountries = [];
    if (value!) {
      selectedCountries.add(country);
    } else {
      selectedCountries.remove(country);
    }
    emit(UserDataLoaded(image != null ? image : null));
  }

//geneder slection
  selectGender(String value) {
    emit(UserDataInitial());
    focusNode.unfocus();
    selectedGender = value;
    emit(UserDataLoaded(image != null ? image : null));
  }

//date slection
  Future<void> selectDate(BuildContext context) async {
    emit(UserDataInitial());
    focusNode.unfocus();
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      emit(UserDataLoaded(image != null ? image : null));
    }
  }

  //upload image
  void getImage() async {
    emit(UserDataInitial());
    focusNode.unfocus();
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(UserDataLoaded(image));
    } else {
      print('No img');
    }
  }

  void saveUserData(BuildContext context) async {
    Database db = await DatabaseHelper.instance.database;
    focusNode.unfocus();
    final userData = User(
      username: usernameController.text,
      country: selectedCountries.isNotEmpty
          ? selectedCountries[0]
          : "country not selected",
      gender: selectedGender,
      dateOfBirth: '${selectedDate.toLocal()}'.split(' ')[0],
      imageFilePath: image != null ? image!.path : '',
    );
    if (usernameController.text == null ||
        usernameController.text == "" ||
        selectedCountries.isEmpty ||
        selectedGender == "") {
      // ignore: use_build_context_synchronously
      CommonAlert.showAlertDialog(context, "please add data properly");
      return;
    }
    await UserDataQueries.insertUser(userData, db.database);
    usernameController.text = "";
    selectedCountries = [];
    selectedGender = '';
    selectedDate = DateTime.now();
    image = null;
    // ignore: use_build_context_synchronously
    CommonAlert.showAlertDialog(context, "Data Added Successfully");
    emit(UserDataLoaded(null));
  }
}
