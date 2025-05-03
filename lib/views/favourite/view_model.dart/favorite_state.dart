part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteChanged extends FavoriteState {}

class FavoriteEmpty extends FavoriteState {}

