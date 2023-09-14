import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/data/cart_item.dart';
import 'package:groceryapp/features/cart/bloc/cart_bloc.dart';
import 'package:groceryapp/features/cart/ui/card_product_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionableState,
      buildWhen: (previous, current) => current is !CartActionableState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType)
        {
          case CartSuccessState:

          final successState = state as CartSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Grocery App Cart"),
                centerTitle: true,
                
              ),
              body: ListView.builder(
                  itemCount: successState.cartAddedProducts.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                        homeBloc: cartBloc,
                        productDataModel: successState.cartAddedProducts[index]);
                  }),
            );

          default: return Scaffold(appBar: AppBar(), body: SizedBox(),);
        }
      },
    );
  }
}
