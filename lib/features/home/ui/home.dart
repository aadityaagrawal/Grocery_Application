import 'package:flutter/material.dart';
import 'package:groceryapp/features/cart/ui/cart.dart';
import 'package:groceryapp/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/features/wishlist/ui/wishlist.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cart Page")));
        }

        if(state is HomeNavigateToWishlistPageActionState)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishlistPage()));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Wishlist Page")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: const Text("Grocery App"),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistNavigateEvent());
                    }, icon: const Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_cart_outlined))
              ]),
        );
      },
    );
  }
}
