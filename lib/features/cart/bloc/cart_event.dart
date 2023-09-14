part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartItemRemoval extends CartEvent {}

class CartInitialEvent extends CartEvent {}
