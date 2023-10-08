part of '../user_data_entry_screen.dart';

class Country extends StatelessWidget {
  const Country({super.key});
  @override
  Widget build(BuildContext context) {
    UserDataCubit bloc = BlocProvider.of<UserDataCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Country:', style: DataEntryScreenTextStyles.subHeads),
          Row(
            children: bloc.countries.map((country) {
              return Row(
                children: [
                  Checkbox(
                    value: bloc.selectedCountries.contains(country),
                    onChanged: (value) {
                      bloc.chnageCountries(value!, country);
                    },
                  ),
                  Text(country, style: DataEntryScreenTextStyles.radioHeads),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
