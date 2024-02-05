import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    //add to cart
    Provider.of<CoffeeShop>(context, listen: false).RemoveItemToCart(coffee);
  }

  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Text('Your Cart', style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 25,
                    ),

                    //list of cart items
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.userCart.length,
                            itemBuilder: (context, index) {
                              //get indivual cart items
                              Coffee eachCoffee = value.userCart[index];
                              //return coffee tile
                              return CoffeeTile(
                                  coffee: eachCoffee,
                                  onPressed: () => removeFromCart(eachCoffee),
                                  icon: Icon(Icons.delete));
                            })),
                    //pay Button
                    Container(
                      padding: EdgeInsets.all(25),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
