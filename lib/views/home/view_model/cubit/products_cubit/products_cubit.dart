import 'package:angelina/core/services/local_storage/favorite_storage_service.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/core/services/api_service/products_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsApi _api;
  List<ProductModel> productList = [];
  String selectedCategory = 'All';
  int currentPage = 1;
  bool isLoading = false; // Prevents multiple API calls

  ProductsCubit(this._api) : super(ProductsInitial());

  Future<void> getProducts([String? category]) async {
    if (isLoading) return;
    isLoading = true;
    emit(ProductsLoading());
    //await Future.delayed(Duration(milliseconds: 500));
    //selectedCategory = category ?? 'All';

    var products = await _api.getProducts(currentPage);
    // print("=======> $currentPage");
    products.fold(
      (failure) {
        isLoading = false;
        emit(ProductsError(failure.errMessage));
      },
      (newProducts) async {
        if (newProducts.isNotEmpty) {
          List<ProductModel> favoriteList =
              await FavoritesStorageService.loadFavorites();

          // Mark products as favorite if they exist in the favorites list
          for (var product in newProducts) {
            product.isFav = favoriteList.any((fav) => fav.id == product.id);
          }
          productList.addAll(newProducts);
          if (currentPage < 6) {
            currentPage++;
          }
        }
        isLoading = false;
        emit(ProductsSuccess(productList));
      },
    );
  }

  void toggleFavorite() async {
    List<ProductModel> favoriteList =
        await FavoritesStorageService.loadFavorites();

    // Mark products as favorite if they exist in the favorites list
    for (var product in productList) {
      product.isFav = favoriteList.any((fav) => fav.id == product.id);
    }
    emit(ProductsSuccess(productList));
  }

  void updateProductButton(int productId, bool isEnabled) {
  int index = productList.indexWhere((p) => p.id == productId);
  if (index != -1) {
    productList[index].buttonEnabled = isEnabled;
    emit(ProductsSuccess(productList));
  }
}
}
