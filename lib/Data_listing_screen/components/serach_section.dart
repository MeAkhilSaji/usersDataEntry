part of '../user_data_listing.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: BlocProvider.of<UserListingCubit>(context).searchController,
        decoration: InputDecoration(
          hintText: 'Search Users',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              BlocProvider.of<UserListingCubit>(context).searchUsers();
            },
          ),
        ),
      ),
    );
  }
}
