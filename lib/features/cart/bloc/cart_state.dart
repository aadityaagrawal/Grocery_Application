part of 'cart_bloc.dart';

abstract class CartState {}
abstract class CartActionableState extends CartState{}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState{
  final List<ProductDataModel> cartAddedProducts;

  CartSuccessState({required this.cartAddedProducts});

}


