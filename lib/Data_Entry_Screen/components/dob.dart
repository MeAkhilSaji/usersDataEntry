part of '../user_data_entry_screen.dart';

class Dob extends StatelessWidget {
  const Dob({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date of Birth:', style: DataEntryScreenTextStyles.subHeads),
          InkWell(
            onTap: () {
              BlocProvider.of<UserDataCubit>(context).selectDate(context);
            },
            child: InputDecorator(
              isFocused: false,
              decoration: InputDecoration(
                  hintText: 'Select Date',
                  hintStyle: DataEntryScreenTextStyles.username),
              child: Text(
                BlocProvider.of<UserDataCubit>(context).selectedDate != null
                    ? '${BlocProvider.of<UserDataCubit>(context).selectedDate.toLocal()}'
                        .split(' ')[0]
                    : 'Select Date',
                style: DataEntryScreenTextStyles.username,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
