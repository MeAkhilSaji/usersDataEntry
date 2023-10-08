import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userdetails/Data_Entry_Screen/cubit/user_data_cubit.dart';
import 'package:userdetails/Data_listing_screen/user_data_listing.dart';
import 'package:userdetails/core/core_ui.dart';

part 'components/username.dart';
part 'components/country.dart';
part 'components/gender.dart';
part 'components/dob.dart';
part 'components/upload_image.dart';
part 'components/save_data.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  _DataEntryScreenState createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Entry'),
      ),
      body: BlocProvider(
        create: (context) => UserDataCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: BlocBuilder<UserDataCubit, UserDataState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UserName(),
                    Country(),
                    Gender(),
                    Dob(),
                    UploadImg(
                        img: state is UserDataLoaded ? state.image : null),
                    SaveData(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDataList(),
                          ),
                        );
                      },
                      child: const Text('View User Data'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
