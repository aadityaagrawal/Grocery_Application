import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:groceryapp/data/cart_item.dart';
import 'package:groceryapp/features/home/model/product_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
      emit(CartSuccessState(cartAddedProducts: cartProduct));
  }
}
