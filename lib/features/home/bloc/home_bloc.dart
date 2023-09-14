import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
   
     on<HomeWishlistNavigateEvent>(homeWishlistNavigateEvent);

     on<HomeCartNavigateEvent>(homeCartNavigateEvent);


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
