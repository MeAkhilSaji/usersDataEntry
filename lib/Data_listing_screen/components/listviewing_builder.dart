part of '../user_data_listing.dart';

class UsersListingBuilder extends StatelessWidget {
  final ScrollController scrollController;
  const UsersListingBuilder({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    UserListingCubit userDetailsCubit =
        BlocProvider.of<UserListingCubit>(context);
    print(userDetailsCubit.hasReachedMax);

    return ListView.builder(
      controller: scrollController,
      itemCount: userDetailsCubit.userList!.length +
          (userDetailsCubit.hasReachedMax ? 0 : 1),
      itemBuilder: (BuildContext context, int index) {
        if (index < userDetailsCubit.userList!.length) {
          return UsersListViewElements(user: userDetailsCubit.userList![index]);
        } else {
          return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 10),
              child: const CircularProgressIndicator());
        }
      },
    );
  }
}
