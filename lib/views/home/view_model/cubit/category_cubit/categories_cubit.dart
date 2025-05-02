import 'package:angelina/models/category/category_model.dart';
import 'package:angelina/services/api_service/category.api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryApi _api;
  List<CategoryModel> ctgList = [];
  CategoriesCubit(this._api) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var ctg = await _api.fetchCategories();
    ctg.fold(
      (left) {
        emit(CategoriesError(left.errMessage));
      },
      (right) {
        ctgList = right;
        // if(ctgList.contains(element))
        emit(CategoriesSuccess(right));
      },
    );
  }
}
