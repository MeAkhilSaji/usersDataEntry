part of '../user_data_listing.dart';

class UsersListViewElements extends StatelessWidget {
  final User user;
  const UsersListViewElements({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text('Username: ${user.username}\n',
            style: DataListingScreenTextStyles.main),
        subtitle: Text(
            'Country: ${user.country}\n\nGender: ${user.gender}\n\nDate of Birth: ${user.dateOfBirth}',
            style: DataListingScreenTextStyles.subHead),
        leading: user.imageFilePath.isNotEmpty
            ? Image.file(File(user.imageFilePath))
            : const SizedBox(),
      ),
    );
  }
}
