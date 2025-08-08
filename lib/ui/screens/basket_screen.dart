import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/basket_provider.dart';
import '../widgets/product_basket_widget.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final basketProvider = Provider.of<BasketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Basket"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(basketProvider.basketItems.length.toString(), style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
      body:  SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final basket = basketProvider.basketItems[index];
                return ProductBasketWidget(basketModel:  basket);
              }, childCount: basketProvider.basketItems.length),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),
                child:  Text("Total: ${basketProvider.getTotalPrice}"),

              )
            )
          ],
        ),
      ),
    );
  }
}
