import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:groceryapp/data/grocery_data.dart';
import 'package:groceryapp/features/home/model/product_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
     on<HomeInitialEvent>(homeInitialEvent);
     on<HomeWishlistNavigateEvent>(homeWishlistNavigateEvent);
     on<HomeCartNavigateEvent>(homeCartNavigateEvent);
  }
   FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeSuccessState( 
      productModel: GroceryData.groceryProducts.map((e) => 
      ProductDataModel(id: e['id'], name: e['name'], 
      description: e['description'], price: e['price'], 
      imageUrl: e['imageUrl'])).toList() 
    ));
  }
  FutureOr<void> homeWishlistNavigateEvent(HomeWishlistNavigateEvent event, Emitter<HomeState> emit) {
    print("Home Wishlist button clicked");
    emit(HomeNavigateToWishlistPageActionState());

  }
  FutureOr<void> homeCartNavigateEvent(HomeCartNavigateEvent event, Emitter<HomeState> emit) {
  print("Home Cart button clicked");
  emit(HomeNavigateToCartPageActionState());
  }
}
