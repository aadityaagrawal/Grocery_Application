import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:groceryapp/features/wishlist/ui/wishlist_card_widget.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final wishlistBloc = WishlistBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listenWhen: (previous, current) => current is WishlistActionableState,
      buildWhen: (previous, current) => current is !WishlistActionableState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType)
        {
          case WishlistSuccessState:

          final successState = state as WishlistSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Grocery App Cart"),
                centerTitle: true,
                
              ),
              body: ListView.builder(
                  itemCount: successState.productAddedInWishList.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(productDataModel: successState.productAddedInWishList[index], 
                    homeBloc: wishlistBloc,
                    );
                  }),
            );

          default: return Scaffold(appBar: AppBar(), body: SizedBox(),);
        }
      },
    );
  }
}
