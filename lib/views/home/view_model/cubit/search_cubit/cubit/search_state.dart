part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchEmpty extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchError extends SearchState {
  final String errMessage;

  SearchError(this.errMessage);
}

final class SearchChanged extends SearchState {
  final List<ProductModel> searchedProducts;

  SearchChanged(this.searchedProducts);
}
