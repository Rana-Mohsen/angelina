part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;

  ProductsSuccess(this.products);
}

class ProductsError extends ProductsState {
  final String errMessage;

  ProductsError(this.errMessage);
}
