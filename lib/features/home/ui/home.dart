import 'package:flutter/material.dart';
import 'package:groceryapp/features/cart/ui/cart.dart';
import 'package:groceryapp/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/features/wishlist/ui/wishlist.dart';

import 'product_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Cart Page")));
        } 
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistPage()));
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Wishlist Page")));
        } 
        if (state is ProductAddedInCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Product added in cart")));
        } 
        if (state is ProductAddedInWishlistState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Product added in wishlist")));
        }
      },

      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeSuccessState:
            final successState = state as HomeSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Grocery App"),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_cart_outlined))
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.productModel.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        homeBloc: homeBloc,
                        productDataModel: successState.productModel[index]);
                  }),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error while loading"),
              ),
            );

          default:
            return const Scaffold(
              body: SizedBox(
                child: Text("Hello bro what's up"),
              ),
            );
        }
      },
    );
  }
}
