import 'package:angelina/core/services/local_storage/favorite_storage_service.dart';
import 'package:angelina/core/services/notification/notification_service.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  Future<void> favoritBody() async {
          emit(FavoriteLoading());

    Map<int,ProductModel> favList = await FavoritesStorageService.loadFavorites();
    if (favList.isEmpty) {
      emit(FavoriteEmpty());
    } else {
      emit(FavoriteChanged(favList));
    }
  }

  Future<void> addFavorit(ProductModel product) async {
    // product.isFav = true;
    // NotificationService.showNotification(
    //   id: 1,
    //   title: 'Anglina',
    //   body: 'added items to favorite 🎉',
    // );

    await FavoritesStorageService.addFavorite(product);
    // emit(FavoriteChanged());
    await favoritBody();
  }

  Future<void> removeFavorit(ProductModel product) async {
    product.isFav = false;
    await FavoritesStorageService.removeFavorite(product.id);
    // emit(FavoriteChanged());
    await favoritBody();
  }

 
}
