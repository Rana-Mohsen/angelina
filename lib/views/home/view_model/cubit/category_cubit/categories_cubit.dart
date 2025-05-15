import 'package:angelina/core/services/local_storage/favorite_storage_service.dart';
import 'package:angelina/models/category/category_model.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/core/services/api_service/category_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryApi _api;
  List<CategoryModel> ctgList = [];
  int currentPage = 1;
  bool isLoading = false;
  List<ProductModel> ctgProductList = [];
  int? currentCategoryId;
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

  Future<void> getOneCategory(int ctgId) async {
    if (isLoading) return;
    isLoading = true;
    //emit(OneCategoryLoading());

    if (currentCategoryId != ctgId) {
      ctgProductList.clear();
      currentCategoryId = ctgId; 
      currentPage = 1; 
    }
    var ctg = await _api.fetchOneCategory(ctgId, currentPage);
    ctg.fold(
      (left) {
        isLoading = false;

        emit(OneCategoryError(left.errMessage));
      },
      (newProducts) async {
        if (newProducts.isNotEmpty) {
          Map<int, ProductModel> favoriteMap =
              await FavoritesStorageService.loadFavorites();

          for (var product in newProducts) {
            product.isFav = favoriteMap.containsKey(product.id);
          }
          ctgProductList.addAll(newProducts);

          if (currentPage < 6) {
            currentPage++;
          }
        }
        isLoading = false;

        emit(OneCategorySuccess(ctgProductList));
      },
    );
  }
}
