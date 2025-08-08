import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_training/models/product_model.dart';

import '../../provider/basket_provider.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;
  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final basketProvider = Provider.of<BasketProvider>(context);

    return ListTile(
      leading: CircleAvatar(child: Text(product.name[0])),
      title: Text(product.name),
      subtitle: Text(product.price.toString()),
      trailing: SizedBox(
        width: 48,
        child: IconButton(
          onPressed: () {
            final item = basketProvider.getItem(product);
            if(item == null) {
              basketProvider.addProduct(product);
            } else {
              basketProvider.increaseQuantity(item);
            }
          },
          icon: Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }
}
