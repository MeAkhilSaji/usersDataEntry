part of '../user_data_entry_screen.dart';

class SaveData extends StatelessWidget {
  const SaveData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<UserDataCubit>(context).saveUserData(context);
        },
        child: const Text('Save User'),
      ),
    );
  }
}
