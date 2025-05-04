import 'package:angelina/constants.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  favoritBody() {
    if (favList.isEmpty) {
      emit(FavoriteEmpty());
    } else {
      emit(FavoriteChanged());
    }
  }

  addFavorit(ProductModel product) {
    favList.add(product);
    product.isFav = true;
  }

  removeFavorit(ProductModel product) {
    favList.remove(product);
    product.isFav = false;
  }
}
