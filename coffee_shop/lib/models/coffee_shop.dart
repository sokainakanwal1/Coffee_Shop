import 'package:coffee_shop/consts.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale list
  final List<Coffee> _shop = [
    //black coffee
    Coffee(name: 'Long Black', price: '200Rs', imagePath: coffee),
    //latte
    Coffee(name: 'Latte', price: '300Rs', imagePath: latte),
    //espresso
    Coffee(name: 'Espresso', price: '250Rs', imagePath: espresso),
    //iced coffee
    Coffee(name: 'Ice Coffee', price: '350Rs', imagePath: icedCoffee)
  ];
  // user cart
  List<Coffee> _userCart = [];
  // get user cart
  List<Coffee> get userCart => _userCart;
  // get coffee list
  List<Coffee> get coffeeShop => _shop;
  //add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void RemoveItemToCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
