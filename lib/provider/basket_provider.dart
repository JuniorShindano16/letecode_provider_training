
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class BasketProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Product> get getProducts => products;



num setGlobaPrice (){
  num price = 0;
  for (var product in products) {
    price += product.price * product.quantity;
  }
  return price;

}
  num get getTotalPrice => setGlobaPrice();

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }
  void removeProduct(Product product) {
    products.remove(product);
    notifyListeners();
  }

  void clearBasket() {
    products.clear();
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    product.quantity++;
    notifyListeners();

  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      product.isSelect= false;
      products.remove(product);
    }
    notifyListeners();
  }



}