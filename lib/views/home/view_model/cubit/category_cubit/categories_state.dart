part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}


class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> ctg;

  CategoriesSuccess(this.ctg);
}

class CategoriesError extends CategoriesState {
  final String errMessage;

  CategoriesError(this.errMessage);
}
class OneCategoryLoading extends CategoriesState {}

class OneCategoryError extends CategoriesState {
  final String errMessage;

  OneCategoryError(this.errMessage);
}
class OneCategorySuccess extends CategoriesState {
  final List<ProductModel> ctg;

  OneCategorySuccess(this.ctg);
}