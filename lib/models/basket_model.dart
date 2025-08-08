import 'package:provider_training/models/product_model.dart';

class BasketModel {
  Product product;
  int quantity;

  BasketModel({required this.product, required this.quantity});
}