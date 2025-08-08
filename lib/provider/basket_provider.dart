
import 'package:flutter/cupertino.dart';
import 'package:provider_training/models/basket_model.dart';

import '../models/product_model.dart';

class BasketProvider extends ChangeNotifier {
  final List<BasketModel> _basketItems = [];
  List<BasketModel> get basketItems => _basketItems;

  num get getTotalPrice => _basketItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));

  void addProduct(Product product) {
    _basketItems.add(BasketModel(product: product, quantity: 1));
    notifyListeners();
  }

  void removeProduct(Product product) {
    _basketItems.removeWhere((i) => i.product == product);
    notifyListeners();
  }

  BasketModel? getItem(Product product) {
    try {
      return _basketItems.firstWhere((test) => test.product == product,);
    } catch (e){
      return null;
    }
  }

  void clearBasket() {
    _basketItems.clear();
    notifyListeners();
  }

  void increaseQuantity(BasketModel basket) {
    basket.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(BasketModel basket) {
    if (basket.quantity > 1) {
      basket.quantity--;
    } else {
      removeProduct(basket.product);
    }
    notifyListeners();
  }
}