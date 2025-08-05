import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../provider/basket_provider.dart';

class ProductBasketWidget extends StatelessWidget {
  final Product product;

  const ProductBasketWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketProvider>(context);
    return ListTile(
      leading: CircleAvatar(child: Text(product.name[0])),
      title: Row(spacing: 5,
        children: [
          Text(product.name),  IconButton(
            onPressed: () {
              basket.removeProduct(product);
            },
            icon: Icon(Icons.delete),
          ),
        ],

      ),
      subtitle: Text(product.price.toString()),
      trailing: SizedBox(
        width: 120,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    basket.decreaseQuantity(product);
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(product.quantity.toString()),
                IconButton(
                  onPressed: () {
                    basket.increaseQuantity(product);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
