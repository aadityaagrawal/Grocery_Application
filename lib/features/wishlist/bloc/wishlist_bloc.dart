import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:groceryapp/data/wishlisted_item.dart';
import 'package:groceryapp/features/home/model/product_model.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
   on<WishlistInitialEvent>(wishlistInitialEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(
      productAddedInWishList: wishlistedProduct
    ));
  }
}
