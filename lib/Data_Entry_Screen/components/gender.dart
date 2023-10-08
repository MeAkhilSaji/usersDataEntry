part of '../user_data_entry_screen.dart';

class Gender extends StatelessWidget {
  const Gender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Gender:', style: DataEntryScreenTextStyles.subHeads),
        Row(
          children: [
            Radio(
              value: 'Male',
              groupValue:
                  BlocProvider.of<UserDataCubit>(context).selectedGender,
              onChanged: (value) {
                BlocProvider.of<UserDataCubit>(context).selectGender(value!);
              },
            ),
            Text('Male', style: DataEntryScreenTextStyles.radioHeads)
          ],
        ),
        Row(
          children: [
            Radio(
              value: 'Female',
              groupValue:
                  BlocProvider.of<UserDataCubit>(context).selectedGender,
              onChanged: (value) {
                BlocProvider.of<UserDataCubit>(context).selectGender(value!);
              },
            ),
            Text('Female', style: DataEntryScreenTextStyles.radioHeads)
          ],
        ),
      ],
    );
  }
}
