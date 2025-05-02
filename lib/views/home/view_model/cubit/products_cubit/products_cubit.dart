import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/services/api_service/products_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsApi _api;
  List<ProductModel> productList = [];
  String selectedCategory = 'All';

  ProductsCubit(this._api) : super(ProductsInitial());
  Future<void> getProducts([String? category]) async {
    selectedCategory = category ?? 'All';
    emit(ProductsLoading());
    var products = await _api.getProducts();
    //print(products);

    products.fold(
      (left) {
        emit(ProductsError(left.errMessage));
      },
      (right) {
        productList = right;
        emit(ProductsSuccess(productList));
        // _emitFilteredList();
      },
    );
  }

  // void toggleFavorite(ProductModel item) {
  //   item.isFav = !item.isFav;
  //   if (item.isFav) {
  //     favList.add(item);
  //   } else {
  //     favList.removeWhere((i) => i.id == item.id);
  //   }
  //   //emit(ProductsSuccess(List.from(productList)));
  //   _emitFilteredList();
  // }

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
