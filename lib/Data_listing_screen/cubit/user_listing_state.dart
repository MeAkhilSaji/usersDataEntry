part of 'user_listing_cubit.dart';

@immutable
sealed class UserListingState {}

final class UserListingInitial extends UserListingState {}

final class UserListingLoaded extends UserListingState {
  final List<User> userList;

  UserListingLoaded({required this.userList});
}
