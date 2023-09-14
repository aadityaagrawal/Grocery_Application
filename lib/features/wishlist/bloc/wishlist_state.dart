part of 'wishlist_bloc.dart';

abstract class WishlistState {}

class WishlistActionableState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState{
  final List<ProductDataModel> productAddedInWishList;

  WishlistSuccessState({required this.productAddedInWishList});

}
class WishlistErrorState extends WishlistState{}

