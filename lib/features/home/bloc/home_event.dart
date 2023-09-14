part of 'home_bloc.dart';


abstract class HomeEvent {}



class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistClickedEvent extends HomeEvent {
  final ProductDataModel wishlistProduct;

  HomeProductWishlistClickedEvent({required this.wishlistProduct});

}

class HomeProductCartClickedEvent extends HomeEvent {
  final ProductDataModel cartProduct;

  HomeProductCartClickedEvent({required this.cartProduct});
}

class HomeWishlistNavigateEvent extends HomeEvent {}

class HomeCartNavigateEvent extends HomeEvent {}



