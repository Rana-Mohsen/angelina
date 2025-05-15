import 'package:angelina/core/services/api_service/products_api.dart';
import 'package:angelina/core/services/local_storage/favorite_storage_service.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._api) : super(SearchInitial());
  final ProductsApi _api;
  init() {
    emit(SearchInitial());
  }

  Future<void> searchProducts(String searchWord) async {
    emit(SearchLoading());

    final result = await _api.searchProducts(searchWord);

    result.fold(
      (failure) {
        emit(SearchError(failure.errMessage));
      },
      (products) async {
        List<ProductModel> searched = products;
        if (searched.isNotEmpty) {
          Map<int, ProductModel> favoriteMap =
              await FavoritesStorageService.loadFavorites();

          for (var product in searched) {
            product.isFav = favoriteMap.containsKey(product.id);
          }
          // productList.addAll(searched);
          // if (currentPage < 6) {
          //   currentPage++;
          // }
        }
        if (searched.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchChanged(products));
        }
      },
    );
  }
}
