import 'package:angelina/constants.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/services/api_service/products_api.dart';
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
    selectedCategory = category ?? 'All';

    var products = await _api.getProducts(currentPage);
    print("=======> $currentPage");
    products.fold(
      (failure) {
        isLoading = false;
        emit(ProductsError(failure.errMessage));
      },
      (newProducts) {
        if (newProducts.isNotEmpty) {
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

  void toggleFavorite() {
    emit(ProductsSuccess(productList));
  }

  // void _emitFilteredList() {
  //   if (selectedCategory != 'All') {
  //     final filtered =
  //         productList
  //             .where((product) => product.categoryName == selectedCategory)
  //             .toList();
  //     emit(ProductsSuccess(filtered));
  //   } else {
  //     emit(ProductsSuccess(productList));
  //   }
  // }
}
