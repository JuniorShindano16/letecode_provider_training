import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../provider/basket_provider.dart';
import '../widgets/product_item_widget.dart';
import 'basket_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product(id: "1", name: "Bag", coverImg: "", price: 100),
    Product(id: "2", name: "shoes", coverImg: "", price: 200),
    Product(id: "3", name: "sweat", coverImg: "", price: 300),
  ];
  @override
  Widget build(BuildContext context) {

    final basket = Provider.of<BasketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              products = [];
            });
          }, icon: Icon(Icons.search)),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BasketScreen()),
                  );
                },
                icon: Icon(Icons.shopping_cart),
              ),
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
                  child: Text(basket.basketItems.length.toString(), style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = products[index];
                return ProductItemWidget(product: product);
              }, childCount: products.length),
            ),
          ],
        ),
      ),
    );
  }
}
