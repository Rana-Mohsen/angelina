import 'package:angelina/core/services/local_storage/favorite_storage_service.dart';
import 'package:angelina/core/services/notification/notification_service.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/core/services/api_service/products_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsApi _api;
  List< ProductModel> productList = [];
  int currentPage = 1;
  bool isLoading = false; 

  ProductsCubit(this._api) : super(ProductsInitial());

  Future<void> getProducts([String? category]) async {
    if (isLoading) return;
    isLoading = true;
    emit(ProductsLoading());

    var products = await _api.getProducts(currentPage);

    products.fold(
      (failure) {
        isLoading = false;
        emit(ProductsError(failure.errMessage));
      },
      (newProducts) async {
        if (newProducts.isNotEmpty) {
          _filterProductsAddedToday(newProducts);

          Map<int, ProductModel> favoriteMap =
              await FavoritesStorageService.loadFavorites();

          for (var product in newProducts) {
            product.isFav = favoriteMap.containsKey(product.id);
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
    Map<int, ProductModel> favoriteMap =
        await FavoritesStorageService.loadFavorites();

    for (var product in productList) {
      product.isFav = favoriteMap.containsKey(product.id);
    }
    emit(ProductsSuccess(productList)); 
  }
void _filterProductsAddedToday(List<ProductModel> products) {
  DateTime today = DateTime.now();
  String todayString = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

  var newProducts = products.where((product) {
    String createdDate = product.dateCreated.split("T")[0]; 
    return createdDate == todayString;
  }).toList();

  if (newProducts.isNotEmpty) {
     NotificationService.showNotification(
      id: 1,
      title: 'Anglina',
      body: 'new products added come check it out 🎉',
    );
  } 
}

  // void updateProductButton(int productId, bool isEnabled) {
  //   if (productList.containsKey(productId)) {
  //     productList[productId]!.buttonEnabled = isEnabled;
  //     emit(ProductsSuccess(productList));
  //   }
  // }
}
