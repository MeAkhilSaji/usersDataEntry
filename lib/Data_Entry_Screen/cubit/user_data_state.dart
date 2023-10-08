part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoaded extends UserDataState {
  File? image;

  UserDataLoaded(this.image);
}
