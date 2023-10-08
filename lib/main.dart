import 'package:flutter/material.dart';
import 'package:userdetails/Data_Entry_Screen/user_data_entry_screen.dart';
import 'package:userdetails/core/core_ui.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'User Data',
    theme: ThemeInfo.theme,
    home: const DataEntryScreen(),
  ));
}
