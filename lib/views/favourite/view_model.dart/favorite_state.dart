part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteChanged extends FavoriteState {
  final List<ProductModel> favList;

  FavoriteChanged(this.favList);
}

class FavoriteEmpty extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}
