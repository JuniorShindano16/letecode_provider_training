import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_training/models/basket_model.dart';

import '../../models/product_model.dart';
import '../../provider/basket_provider.dart';

class ProductBasketWidget extends StatelessWidget {
  final BasketModel basketModel;

  const ProductBasketWidget({super.key, required this.basketModel});

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketProvider>(context);

    return ListTile(
      leading: CircleAvatar(child: Text(basketModel.product.name[0])),
      title: Row(spacing: 5,
        children: [
          Text(basketModel.product.name),  IconButton(
            onPressed: () {
              basket.removeProduct(basketModel.product);
            },
            icon: Icon(Icons.delete),
          ),
        ],

      ),
      subtitle: Text(basketModel.product.price.toString()),
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
                    basket.decreaseQuantity(basketModel);
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(basketModel.quantity.toString()),
                IconButton(
                  onPressed: () {
                    basket.increaseQuantity(basketModel);
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
